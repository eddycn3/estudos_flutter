import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";

const cardColor = Color(0XFF1D1E33);
const footerColor = Color(0XFFEC5252);
const footerHight = 80.0;
const cardTextColor = Color(0XFF8D8E98);
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // floatingActionButtonTheme:
        //     FloatingActionButtonT
      ),
      home: InputPage(),
    );
  }
}
//Color(0xFF0A0E21)

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    reusableCardColor: cardColor,
                    reusableCardChild: GenderReusable(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: "MALE",
                      genderTextColor: cardTextColor,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    reusableCardChild: GenderReusable(
                      genderIcon: FontAwesomeIcons.venus,
                      genderText: "FEMALE",
                      genderTextColor: cardTextColor,
                    ),
                    reusableCardColor: cardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            reusableCardColor: cardColor,
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  reusableCardColor: cardColor,
                )),
                Expanded(
                    child: ReusableCard(
                  reusableCardColor: cardColor,
                )),
              ],
            ),
          ),
          Container(
            color: footerColor,
            height: footerHight,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
          )
        ],
      ),
    );
  }
}

class GenderReusable extends StatelessWidget {
  GenderReusable(
      {@required this.genderIcon,
      @required this.genderText,
      @required this.genderTextColor});

  final IconData genderIcon;
  final String genderText;
  final Color genderTextColor;

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
        Text(
          genderText,
          style: TextStyle(fontSize: 18.0, color: genderTextColor),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.reusableCardColor, this.reusableCardChild});

  final Color reusableCardColor;
  final Widget reusableCardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: reusableCardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: reusableCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

// Container(
//         margin: EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           color: Color(0xFF1D1E33),
//           borderRadius: BorderRadius.circular(10),
//         ),
//       )
