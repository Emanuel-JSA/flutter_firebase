import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(user!.email!),
              ),
              const SizedBox(height: 32.0),
              CupertinoButton(
                color: CupertinoColors.systemRed,
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
