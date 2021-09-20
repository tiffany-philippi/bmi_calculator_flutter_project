import 'package:bmi_calculator_flutter_project/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(0XFFd0cfd1),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: const Color(0XFF564769),
              primary: const Color(0XFF564769))),
      home: InputPage(),
    );
  }
}
