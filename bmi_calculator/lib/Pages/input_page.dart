import 'package:bmi_calculator/widgets/button_icon.dart';
import 'package:bmi_calculator/widgets/icon_gender.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

enum GenderType { mars, venus }

enum ButtonType { minus, plus }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;
  int peso = 40;
  int idade = 10;

  setPeso(ButtonType btnT) {
    var pVar = peso;
    setState(() {
      if (btnT == ButtonType.minus) {
        peso--;
      } else {
        peso++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    updateColor: () {
                      setState(() {
                        selectedGender = GenderType.mars;
                      });
                    },
                    reusableCardColor: selectedGender == GenderType.mars
                        ? kactiveColor
                        : kinactiveColor,
                    reusableCardChild: IconGender(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: "MASCULINO",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    updateColor: () {
                      setState(() {
                        selectedGender = GenderType.venus;
                      });
                    },
                    reusableCardColor: selectedGender == GenderType.venus
                        ? kactiveColor
                        : kinactiveColor,
                    reusableCardChild: IconGender(
                      genderIcon: FontAwesomeIcons.venus,
                      genderText: "FEMININO",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            reusableCardChild: Column(
              children: <Widget>[
                Text(
                  "ALTURA",
                  style: klabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: knumberStyle,
                    ),
                    Text(
                      "cm",
                      style: klabelStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x1fEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
            reusableCardColor: kactiveColor,
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  reusableCardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "PESO",
                        style: klabelStyle,
                      ),
                      Text(
                        peso.toString(),
                        style: knumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonIcon(
                            icon: FontAwesomeIcons.minus,
                            onClick: () {
                              setPeso(ButtonType.minus);
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ButtonIcon(
                            icon: FontAwesomeIcons.plus,
                            onClick: () {
                              setPeso(ButtonType.plus);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  reusableCardColor: kactiveColor,
                )),
                Expanded(
                    child: ReusableCard(
                  reusableCardColor: kactiveColor,
                  reusableCardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Idade",
                        style: klabelStyle,
                      ),
                      Text(
                        (idade = idade > 0 ? idade : 10).toString(),
                        style: knumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonIcon(
                            icon: FontAwesomeIcons.minus,
                            onClick: () {
                              setState(() {
                                idade--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ButtonIcon(
                            icon: FontAwesomeIcons.plus,
                            onClick: () {
                              setState(() {
                                idade++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          Container(
            color: kfooterColor,
            height: kfooterHight,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
          )
        ],
      ),
    );
  }
}
