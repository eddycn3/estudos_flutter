import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/calc_large_bottom_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final CalculadorBrain calculadorBrain;
  ResultPage(this.calculadorBrain);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text("Seu Resultado",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              reusableCardColor: kactiveColor,
              reusableCardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(calculadorBrain.retornaSituacao(),
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w900,
                          fontSize: 20)),
                  Text(
                    calculadorBrain.getResultadoIMC().toString(),
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    calculadorBrain.retMsg(),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          CalcLargeBottomButton(
            textAction: "RECALCULAR",
            goTo: () => {Navigator.pop(context)},
          )
        ],
      ),
    );
  }
}
