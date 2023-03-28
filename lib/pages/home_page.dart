import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/credit_card.dart';
import '../components/alert_button.dart';
import 'add_card_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cartões'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CreditCard(
                cardNumber: '1234 5678 9012 3456',
                cardName: 'Cartão de casa',
                expiryDate: '12/25',
                cvvCode: '123',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OutlinedButton(
                    child: Text('+ Add card'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCardPage()),
                      );
                    },
                  ),
                  AlertButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    text: 'Logout',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
