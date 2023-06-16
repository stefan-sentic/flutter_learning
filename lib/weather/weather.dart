import 'package:flutter/material.dart';
import 'package:learning/weather/screens/loading_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: const LoadingScreen(),
    );
  }
}
