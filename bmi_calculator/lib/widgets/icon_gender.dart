import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconGender extends StatelessWidget {
  IconGender({@required this.genderIcon, @required this.genderText});

  final IconData genderIcon;
  final String genderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(genderText, style: klabelStyle),
      ],
    );
  }
}
