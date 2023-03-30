import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreditCard extends StatelessWidget {
  final String cardNumber;
  final String cardName;
  final String expiryDate;
  final String cvvCode;
  final String cardColor;

  const CreditCard({
    super.key,
    required this.cardNumber,
    required this.cardName,
    required this.expiryDate,
    required this.cvvCode,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    var hexColor = Color(int.parse('0x$cardColor'));
    Color textColor = hexColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    var kCardTextSmall = TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      color: textColor,
    );

    var kCardTextMedium = TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
      color: textColor,
    );

    var kTextCreditCard = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 6.0,
      wordSpacing: 7.0,
      color: textColor,
    );

    return SizedBox(
      width: double.infinity,
      child: Card(
        color: hexColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.ccVisa, size: 28.0, color: textColor,),
                  Text(expiryDate, style: kCardTextSmall,),
                ],
              ),
              const SizedBox(height: 24.0),
              Text(cardName, style: kCardTextMedium,),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
