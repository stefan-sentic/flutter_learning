import 'package:flutter/material.dart';
import 'package:learning/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter examples'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: getListOfActions(context),
          ),
        ),
      ),
    );
  }

  List<Widget> getListOfActions(BuildContext context) {
    final List<Widget> buttons = [];
    navigationRoutes.forEach((key, value) {
      buttons.add(FilledButton(
          onPressed: () {
            Navigator.pushNamed(context, key);
          },
          child: Text(key.substring(1))));
    });
    return buttons;
  }
}
