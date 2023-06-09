import 'package:flutter/material.dart';
import 'package:learning/quizzler/question_logic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionLogic logic = QuestionLogic();

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: const SafeArea(child: QuizzlerPage()),
    ),
  ),
);

class QuizzlerPage extends StatefulWidget {
  const QuizzlerPage({super.key});

  @override
  State<QuizzlerPage> createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  final List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    logic.getNextQuestionText(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                onAnswerSelected(context, true);
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('True'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                onAnswerSelected(context, false);
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('False'),
              ),
            ),
          ),
          Row(children: scoreKeeper)
        ],
      ),
    );
  }

  void onAnswerSelected(BuildContext context, bool answer) {
    bool isCorrect = logic.checkAnswer(answer);

    setState(() {
      scoreKeeper.add(Icon(isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.green : Colors.red));
    });

    if (logic.isQuizFinished()) {
      Alert(
          context: context,
          title: 'Quiz Completed!',
          desc: 'Well done, thank you for trying this app.',
          buttons: [
            DialogButton(
                child: const Text('Ok'),
                onPressed: () {
                  restartQuiz();
                  Navigator.pop(context);
                })
          ]).show();
    }
  }

  void restartQuiz() {
    setState(() {
      scoreKeeper.clear();
    });
    logic.reset();
  }
}
