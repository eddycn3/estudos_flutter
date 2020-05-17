import 'dart:math';

class CalculadorBrain {
  double _altura;
  int _peso;
  double _resultIMC;
  String _msgRet;
  CalculadorBrain(this._altura, this._peso);

  double getResultadoIMC() {
    return _resultIMC;
  }

  String retornaSituacao() {
    var mod = pow(10.0, 2);
    _resultIMC =
        (((_peso / (_altura * _altura)) * mod).round().toDouble() / mod);
    print(_resultIMC);

    if (_resultIMC < 17) {
      _msgRet = "O seu resultado esta baixo, você precisa comer mais";
      return "Muito abaixo do peso";
    } else if (_resultIMC >= 17 && _resultIMC < 18.49) {
      _msgRet = "O seu resultado esta baixo, você precisa comer mais";
      return "Abaixo do peso";
    } else if (_resultIMC >= 18.49 && _resultIMC < 24.99) {
      _msgRet = "Oba! Seu resultado esta ideal!";
      return "Peso normal";
    } else if (_resultIMC >= 25.0 && _resultIMC < 29.99) {
      _msgRet =
          "O seu resultado esta acima do esperado, da uma segurada no rango!";
      return "Acima do peso";
    } else if (_resultIMC >= 30.0 && _resultIMC < 34.99) {
      _msgRet =
          "O seu resultado esta acima do esperado, da uma segurada no rango!";
      return "Obesidade I";
    } else if (_resultIMC >= 35.0 && _resultIMC < 34.99) {
      _msgRet =
          "O seu resultado esta acima do esperado, da uma segurada no rango!";
      return "Obesidade II (severa)";
    } else {
      _msgRet =
          "O seu resultado esta acima do esperado, da uma segurada no rango!";
      return "Obesidade III (mórbida)";
    }
  }

  String retMsg() {
    return _msgRet;
  }
}
