import 'package:flutter/material.dart';

const Color secondaryColour = Color(0XFFabadba);
const Color accentColour = Color(0XFFb8325a);

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
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ReusebleCard(colour: secondaryColour),
                ReusebleCard(colour: secondaryColour),
              ],
            ),
          ),
          ReusebleCard(colour: secondaryColour),
          Expanded(
            child: Row(
              children: <Widget>[
                ReusebleCard(colour: secondaryColour),
                ReusebleCard(colour: secondaryColour),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
            color: accentColour,
          )
        ],
      ),
    );
  }
}

class ReusebleCard extends StatelessWidget {
  ReusebleCard({required this.colour});

  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
