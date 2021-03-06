import 'package:bmi_calculator_flutter_project/components/bottom_button.dart';
import 'package:bmi_calculator_flutter_project/components/calculator_brain.dart';
import 'package:bmi_calculator_flutter_project/variables/gender_enum.dart';
import 'package:bmi_calculator_flutter_project/screens/result_page.dart';
import 'package:bmi_calculator_flutter_project/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../variables/constants.dart';

Gender selectedGender = Gender.none;
int heightValue = 150;
int weightValue = 60;
int ageValue = 30;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() => {selectedGender = Gender.male});
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveButtonColour
                        : kSecondaryColour,
                    cardChild: IconContent(
                        iconWidget: FontAwesomeIcons.mars, textString: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() => {selectedGender = Gender.female});
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveButtonColour
                        : kSecondaryColour,
                    cardChild: IconContent(
                        iconWidget: FontAwesomeIcons.venus,
                        textString: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              colour: kSecondaryColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: kTextStringStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        heightValue.toString(),
                        style: kTextStringLargeStyle,
                      ),
                      const Text(
                        'cm',
                        style: kTextStringStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: kGreyColour400,
                        activeTrackColor: kAccentColour,
                        thumbColor: kAccentColour,
                        overlayColor: kAccentColourTransparency,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: heightValue.toDouble(),
                      min: 120,
                      max: 240,
                      divisions: 120,
                      onChanged: (double value) {
                        setState(() {
                          heightValue = value.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kSecondaryColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('WEIGHT', style: kTextStringStyle),
                        Text(
                          weightValue.toString(),
                          style: kTextStringLargeStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.add,
                              changeValue: () {
                                setState(() => {weightValue++});
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.remove,
                              changeValue: () {
                                setState(() => {weightValue--});
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kSecondaryColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('AGE', style: kTextStringStyle),
                        Text(ageValue.toString(), style: kTextStringLargeStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.add,
                              changeValue: () {
                                setState(() => {ageValue++});
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.remove,
                              changeValue: () {
                                setState(() => {ageValue--});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: BottomButton(text: 'CALCULATE'),
            onTap: () {
              CalculatorBrain calculator =
                  CalculatorBrain(height: heightValue, weight: weightValue);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calculator.calculateBMI(),
                      resultText: calculator.getResult(),
                      interpretation: calculator.getInterpretation(),
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }
}
