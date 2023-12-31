import 'package:flutter/material.dart';
import 'package:learning/destini/story_logic.dart';

var logic = StoryLogic();

class DestiniScreen extends StatefulWidget {
  const DestiniScreen({super.key});

  @override
  State<DestiniScreen> createState() => _DestiniScreenState();
}

class _DestiniScreenState extends State<DestiniScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/destini/image/background.png'), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  logic.storyText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
              onPressed: () => onPathChosen(choiceNumber: 1),
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(logic.choice1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Visibility(
              visible: logic.showSecondButton,
              child: FilledButton(
                onPressed: () => onPathChosen(choiceNumber: 2),
                style: FilledButton.styleFrom(backgroundColor: Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(logic.choice2),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void onPathChosen({required int choiceNumber}) {
    setState(() {
      logic.nextStory(choiceNumber);
    });
  }
}
