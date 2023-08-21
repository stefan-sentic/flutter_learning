import 'package:flutter/material.dart';

class TriviaLoading extends StatelessWidget {
  const TriviaLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
