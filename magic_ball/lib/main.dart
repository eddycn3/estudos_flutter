import 'package:flutter/material.dart';
import "dart:math";

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue[200],
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("DA MAGIC 8 BALL!"),
          ),
          body: Magic8BallPage(),
        ),
      ),
    );

class Magic8BallPage extends StatefulWidget {
  @override
  _Magic8BallPageState createState() => _Magic8BallPageState();
}

class _Magic8BallPageState extends State<Magic8BallPage> {
  var ballNumber = 1;

  getNextBallNumber() {
    ballNumber = Random().nextInt(5) + 1;
    print(ballNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlatButton(
          child: Image.asset("images/ball$ballNumber.png"),
          onPressed: () {
            setState(() {
              getNextBallNumber();
            });
          },
        ),
      ),
    );
  }
}
