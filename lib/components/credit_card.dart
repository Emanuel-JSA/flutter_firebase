import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../styles/styles.dart';

class CreditCard extends StatelessWidget {
  final String cardNumber;
  final String cardName;
  final String expiryDate;
  final String cvvCode;

  const CreditCard({
    super.key,
    required this.cardNumber,
    required this.cardName,
    required this.expiryDate,
    required this.cvvCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(FontAwesomeIcons.ccVisa, size: 28.0),
                  Text(expiryDate, style: kTextSmall),
                ],
              ),
              const SizedBox(height: 24.0),
              Text(cardName, style: kTextMedium,),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '****',
                    style: kTextCreditCard,
                  ),
                  Text(
                    '****',
                    style: kTextCreditCard,
                  ),
                  Text(
                    '****',
                    style: kTextCreditCard,
                  ),
                  Text(
                    '7785',
                    style: kTextCreditCard,
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
