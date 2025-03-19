import 'package:flutter/material.dart';

class WhiteLargeText extends StatelessWidget {
  final String text;
  const WhiteLargeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      ),
    );
  }
}
