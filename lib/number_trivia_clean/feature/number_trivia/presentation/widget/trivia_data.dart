import 'package:flutter/material.dart';

class TriviaData extends StatelessWidget {
  final int? number;
  final String text;

  const TriviaData({super.key, this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number != null ? number.toString() : "",
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                text,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
