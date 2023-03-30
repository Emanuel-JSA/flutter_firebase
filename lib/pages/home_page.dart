import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/credit_card.dart';
import '../components/alert_button.dart';
import '../model/credit_card_model.dart';
import 'add_card_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<CreditCardModel> _creditCards = [];

  @override
  void initState() {
    super.initState();
    _getCreditCard();
  }

  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                height: 600,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _creditCards.length,
                  itemBuilder: (context, index) {
                    return CreditCard(
                      cardNumber: _creditCards[index].cardNumber,
                      cardName: _creditCards[index].cardName,
                      expiryDate: _creditCards[index].expiryDate,
                      cvvCode: _creditCards[index].cvvCode,
                      cardColor: _creditCards[index].cardColor,
                    );
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OutlinedButton(
                    child: Text('+ Add card'),
                    onPressed: () {
                      _getCreditCard();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AddCardPage()),
                      // );
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

  _getCreditCard() async {
    var db = FirebaseFirestore.instance;

    final String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final docRef = db
        .collection('users')
        .doc(userId)
        .collection('credit_card')
        .withConverter<CreditCardModel>(
          fromFirestore: CreditCardModel.fromFirestore,
          toFirestore: (creditCard, _) => creditCard.toFirestore(),
        );
    await docRef.get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        _creditCards.add(doc.data());
      }
    });
  }
}
