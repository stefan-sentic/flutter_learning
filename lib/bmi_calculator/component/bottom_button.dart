import 'package:flutter/material.dart';

import '../constant.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const BottomButton({
    super.key,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        color: accentColor,
        height: bottomContainerHeight,
        margin: const EdgeInsets.only(top: 8),
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
