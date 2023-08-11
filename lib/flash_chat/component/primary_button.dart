import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onClick;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.color,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 5,
              backgroundColor: color,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              minimumSize: const Size(double.infinity, 48)),
          onPressed: onClick,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
}
