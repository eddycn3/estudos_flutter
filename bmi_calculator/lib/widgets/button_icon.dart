import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  ButtonIcon({this.icon, this.onClick});

  final IconData icon;
  final Function onClick;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onClick,
      elevation: 8.0,
      constraints: BoxConstraints(
        minWidth: 50,
        minHeight: 50,
      ),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
    );
  }
}
