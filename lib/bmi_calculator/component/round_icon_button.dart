import 'package:flutter/material.dart';
import 'package:learning/bmi_calculator/constant.dart';

class RoundIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;

  const RoundIconButton({super.key, this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      fillColor: buttonColor,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
