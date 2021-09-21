import 'package:bmi_calculator_flutter_project/screens/input_page.dart';
import 'package:bmi_calculator_flutter_project/screens/result_page.dart';
import 'package:flutter/material.dart';

import 'variables/constants.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(0XFFd0cfd1),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primaryVariant: kBlack,
              secondary: const Color(0XFF564769),
              primary: const Color(0XFF564769))),
    );
  }
}
