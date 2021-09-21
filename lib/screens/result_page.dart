import 'package:bmi_calculator_flutter_project/components/bottom_button.dart';
import 'package:bmi_calculator_flutter_project/components/calculator_brain.dart';
import 'package:bmi_calculator_flutter_project/variables/constants.dart';
import 'package:bmi_calculator_flutter_project/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  String getIMCAverage() {
    String label = '';
    if (resultText == 'NORMAL') {
      label = '18.5 a 24.9';
    } else if (resultText == 'OVERWEIGHT') {
      label = 'Over 24.9';
    } else {
      label = 'Under 18.5';
    }
    return '$label BMI rage:';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Expanded(
            child: Text(
              'Your Result',
              style: kTitleLargeStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              onPress: () {},
              colour: kSecondaryColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText, style: kResultLabelStyle),
                  Text(bmiResult, style: kResultNumberStyle),
                  Column(
                    children: <Widget>[
                      Text(getIMCAverage(), style: kAverageBMIStyle),
                      Text("$bmiResult kg/m²", style: kTextStringStyle),
                    ],
                  ),
                  Text(
                    interpretation,
                    style: kMessageResultStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: BottomButton(text: 'RE-CALCULATE'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

//
