import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/error_dialog.dart';

class AddCardPage extends StatefulWidget {
  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cardNameController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Card'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  'Please enter your card details below to add a new card.',
                ),
                const SizedBox(height: 32.0),
                TextFormField(
                  controller: _cardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Card Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _cardNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Card Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _expiryDateController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    labelText: 'Expiry Date',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _cvvCodeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'CVV Code',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    submitCard();
                  },
                  child: const Text('Add Card'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future submitCard() async {
    try {
      final String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) return;

      final CollectionReference<Map<String, dynamic>> creditRef =
      FirebaseFirestore.instance.collection('users/$userId/credit_card');

      final DocumentReference<Map<String, dynamic>> newCreditCardRef =
      creditRef.doc();

      var generatedColor = Random().nextInt(Colors.accents.length);

      await newCreditCardRef.set({
        'cardNumber': _cardNumberController.text,
        'cardName': _cardNameController.text,
        'expiryDate': _expiryDateController.text,
        'cvvCode': _cvvCodeController.text,
        'createdAt': FieldValue.serverTimestamp(),
        'color': Colors.primaries[generatedColor].value.toRadixString(16)
      });

      if (!mounted) return;
      Navigator.of(context).pop();
    } on FirebaseException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return ErrorDialog(
            message: e.message ?? 'An error occurred',
          );
        },
      );
    }
  }
}
