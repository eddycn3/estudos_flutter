import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.reusableCardColor,
      this.reusableCardChild,
      this.updateColor});

  final Color reusableCardColor;
  final Widget reusableCardChild;
  final Function updateColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: updateColor,
      child: Container(
        child: reusableCardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: reusableCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
