import 'package:flutter/material.dart';

class TriviaError extends StatelessWidget {
  final String message;

  const TriviaError({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(color: Colors.redAccent, fontSize: 20),
      ),
    );
  }
}
