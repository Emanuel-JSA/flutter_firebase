import 'package:flutter/material.dart';

class AlertButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AlertButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFDAD6),
        foregroundColor: Color(0xFFBA1A1A),
      ),
    );
  }
}