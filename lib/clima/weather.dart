import 'package:flutter/material.dart';
import 'package:learning/clima/screens/loading_screen.dart';

class ClimaApp extends StatelessWidget {
  const ClimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: const LoadingScreen(),
    );
  }
}
