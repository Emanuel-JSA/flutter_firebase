import 'package:flutter/cupertino.dart';

class PasswordRecoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Password Recovery'),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0,),
              Text(
                'Please enter your email address below to recover your password.',
                style: CupertinoTheme.of(context).textTheme.textStyle,
              ),
              const SizedBox(height: 32.0),
              const CupertinoTextField(
                keyboardType: TextInputType.emailAddress,
                placeholder: 'Email',
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.systemGrey4,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              CupertinoButton.filled(
                onPressed: () {
                  // Implement password recovery logic
                },
                child: Text('Recover Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}