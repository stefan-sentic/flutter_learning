import 'package:flutter/material.dart';
import 'package:learning/bmi_calculator/constant.dart';

class CardContent extends StatelessWidget {
  final IconData icon;
  final String text;

  const CardContent({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        const SizedBox(height: 15),
        Text(text, style: labelTextStyle),
      ],
    );
  }
}
