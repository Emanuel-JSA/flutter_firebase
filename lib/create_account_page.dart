import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Create Account'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0),
              CupertinoTextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                placeholder: 'Email',
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.systemGrey4,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              CupertinoTextField(
                controller: _passwordController,
                obscureText: true,
                placeholder: 'Password',
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.systemGrey4,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48.0),
              CupertinoButton(
                onPressed: singUp,
                color: CupertinoColors.systemBlue,
                child: Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future singUp() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      print(credential.user);
      print(credential);
      if (credential.user != null) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Error'),
            content: Text(e.message!),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

  }
}
