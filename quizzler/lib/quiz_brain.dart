import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questions = [
    Question(
        "O Single Malt Whisky é destilado em somente uma destilaria.", true),
    Question("O bourbon é uma bebida da china.", false),
    Question("Uma lesma tem sangue verde.", true),
    Question("Eu gosto de peixe de rio.", false),
    Question("O novo apartamento esta mobiliado.", false),
    Question("Há um portal para narnia no meu armario.", true)
  ];

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) _questionNumber++;
  }

  bool isFinished() {
    if (_questionNumber == _questions.length - 1) {
      return true;
    }
    return false;
  }

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  void reset() {
    _questionNumber = 0;
  }
}
