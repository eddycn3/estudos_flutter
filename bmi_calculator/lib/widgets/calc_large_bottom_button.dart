import 'package:flutter/material.dart';
import '../constants.dart';

class CalcLargeBottomButton extends StatelessWidget {
  CalcLargeBottomButton({this.textAction, this.goTo});

  final String textAction;
  final Function goTo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: goTo,
      child: Container(
        alignment: Alignment.center,
        child: Text(textAction, style: klargeLabelButton),
        color: kfooterColor,
        height: kfooterHight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
