import 'package:bmi_calculator_flutter_project/screens/result_page.dart';
import 'package:flutter/material.dart';
import '../variables/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(
          top: kBorderRadiusCard,
        ),
        width: double.infinity,
        height: kLargeSize,
        color: kAccentColour,
        child: Center(
          child: Text(
            text,
            style: kTextLargeButtonStyle,
          ),
        ),
      ),
    );
  }
}
