import 'package:flutter/material.dart';
import "dart:math";

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("DICEE"),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ));

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftNumber = 1;
  var rightNumber = 1;

  setDiceNumber() {
    leftNumber = Random().nextInt(6) + 1;
    rightNumber = Random().nextInt(6) + 1;
    print("left: $leftNumber");
    print("right: $rightNumber");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  setDiceNumber();
                });
              },
              child: Image.asset('images/dice$leftNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  setDiceNumber();
                });
              },
              child: Image.asset("images/dice$rightNumber.png"),
            ),
          )
        ],
      ),
    );
  }
}
