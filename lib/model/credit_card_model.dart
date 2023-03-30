import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreditCardModel {
  final String cardNumber;
  final String cardName;
  final String expiryDate;
  final String cvvCode;
  final String cardColor;

  CreditCardModel({
    required this.cardNumber,
    required this.cardName,
    required this.expiryDate,
    required this.cvvCode,
    required this.cardColor,
  });

  factory CreditCardModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options,) {
    final data = snapshot.data();
    return CreditCardModel(
      cardNumber: data?['cardNumber'],
      cardName: data?['cardName'],
      expiryDate: data?['expiryDate'],
      cvvCode: data?['cvvCode'],
      cardColor: data?['color'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'cardNumber': cardNumber,
      'cardName': cardName,
      'expiryDate': expiryDate,
      'cvvCode': cvvCode,
      'cardColor': cardColor,
    };
  }
}