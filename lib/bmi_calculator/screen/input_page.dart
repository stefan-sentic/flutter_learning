import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning/bmi_calculator/calculator_logic.dart';
import 'package:learning/bmi_calculator/component/bottom_button.dart';
import 'package:learning/bmi_calculator/component/reusable_card.dart';
import 'package:learning/bmi_calculator/component/round_icon_button.dart';
import 'package:learning/bmi_calculator/screen/results_page.dart';

import '../component/icon_content.dart';
import '../constant.dart';
import '../gender.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var gender = Gender.male;
  var height = 180;
  var weight = 60;
  var age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
          backgroundColor: activeCardColor,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        color: gender == Gender.male ? activeCardColor : inactiveCardColor,
                        onTap: () {
                          setState(() {
                            gender = Gender.male;
                          });
                        },
                        child: const CardContent(
                          icon: FontAwesomeIcons.mars,
                          text: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: gender == Gender.female ? activeCardColor : inactiveCardColor,
                        onTap: () {
                          setState(() {
                            gender = Gender.female;
                          });
                        },
                        child: const CardContent(
                          icon: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ReusableCard(
                color: activeCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('HEIGHT', style: labelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: numberTextStyle),
                        const Text('cm', style: labelTextStyle)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: accentColor,
                          activeTrackColor: Colors.white,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: accentColor.withAlpha(50)),
                      child: Slider(
                          value: height.toDouble(),
                          min: heightMin,
                          max: heightMax,
                          inactiveColor: textColor,
                          onChanged: (newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          }),
                    ),
                  ],
                ),
              )),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        color: activeCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('WEIGHT', style: labelTextStyle),
                            Text(weight.toString(), style: numberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: activeCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('AGE', style: labelTextStyle),
                            Text(age.toString(), style: numberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                text: 'CALCULATE',
                onTap: () {
                  final logic = CalculatorLogic(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                                bmiResult: logic.calculateBMI(),
                                resultText: logic.getResult(),
                                description: logic.getInterpretation(),
                              )));
                },
              )
            ],
          ),
        ));
  }
}
