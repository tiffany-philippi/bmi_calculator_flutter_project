import 'package:flutter/material.dart';
import '../variables/constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.onPress, required this.colour, required this.cardChild});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(kSpaceBetween),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadiusCard),
            color: colour),
      ),
    );
  }
}
