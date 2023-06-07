import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: const Text('Dicee'),
            backgroundColor: Colors.red,
          ),
          body: const DiceePage(),
        ),
      ),
    );

class DiceePage extends StatefulWidget {
  const DiceePage({super.key});

  @override
  State<DiceePage> createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      updateDices();
                    });
                  },
                  child: Image.asset('lib/dicee/image/dice$leftDiceNumber.png'),
                ),
              ),
            ),
            const SizedBox(
                height: 100,
                child: VerticalDivider(thickness: 1, color: Colors.white)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      updateDices();
                    });
                  },
                  child: Image.asset('lib/dicee/image/dice$rightDiceNumber.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateDices() {
    leftDiceNumber = Random().nextInt(6)+1;
    rightDiceNumber = Random().nextInt(6)+1;
  }
}
