import 'package:flutter/material.dart';
import 'package:learning/bmi_calculator/component/reusable_card.dart';

import '../component/bottom_button.dart';
import '../constant.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String description;

  const ResultsPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Your Result',
                  style: titleStyle,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                  child: ReusableCard(
                    color: activeCardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            resultText.toUpperCase(),
                            style: resultTextStyle,
                          ),
                          Text(
                            bmiResult,
                            style: bmiTextStyle,
                          ),
                          Text(
                            description,
                            textAlign: TextAlign.center,
                            style: labelTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BottomButton(
                  text: 'RE-CALCULATE',
                  onTap: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
