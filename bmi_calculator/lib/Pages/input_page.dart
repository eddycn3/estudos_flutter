import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/widgets/button_icon.dart';
import 'package:bmi_calculator/widgets/calc_large_bottom_button.dart';
import 'package:bmi_calculator/widgets/icon_gender.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app_enums.dart';
import '../constants.dart';
import "result_page.dart";

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType _selectedGender;
  int _altura = 180;
  int _peso = 40;
  int _idade = 10;

  setPeso(ButtonType btnT) {
    setState(() {
      if (btnT == ButtonType.minus) {
        _peso--;
      } else {
        _peso++;
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
                    onTapped: () {
                      setState(() {
                        _selectedGender = GenderType.mars;
                      });
                    },
                    reusableCardColor: _selectedGender == GenderType.mars
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
                    onTapped: () {
                      setState(() {
                        _selectedGender = GenderType.venus;
                      });
                    },
                    reusableCardColor: _selectedGender == GenderType.venus
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
                      _altura.toString(),
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
                    value: _altura.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        _altura = newValue.round();
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
                        _peso.toString(),
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
                        (_idade = _idade > 0 ? _idade : 10).toString(),
                        style: knumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonIcon(
                            icon: FontAwesomeIcons.minus,
                            onClick: () {
                              setState(() {
                                _idade--;
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
                                _idade++;
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
          CalcLargeBottomButton(
            textAction: "CALCULAR",
            goTo: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          new CalculadorBrain(_altura / 100, _peso))))
            },
          )
        ],
      ),
    );
  }
}
