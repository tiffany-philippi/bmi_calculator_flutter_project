import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.iconWidget, required this.textString});

  final IconData iconWidget;
  final String textString;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconWidget, size: kSizeIcon),
        const SizedBox(
          height: kSpaceBetween,
        ),
        Text(
          textString,
          style: kTextStringStyle,
        )
      ],
    );
  }
}
