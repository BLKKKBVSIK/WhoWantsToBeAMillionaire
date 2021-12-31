import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:whowanttobeamillionaire/misc/configuration.dart';
import 'package:whowanttobeamillionaire/models/question.dart';

@injectable
class QuestionPageViewModel extends BaseViewModel {
  List<Question> _questions = [];
  List<Question> get questions => _questions;

  String _question = '';
  String get question => _question;

  String _answer0 = '';
  String get answer0 => _answer0;

  String _answer1 = '';
  String get answer1 => _answer1;

  String _answer2 = '';
  String get answer2 => _answer2;

  String _answer3 = '';
  String get answer3 => _answer3;

  String _correctAnswer = '';
  String get correctAnswer => _correctAnswer;

  int _currentQuestion = 0;

  int _score = 0;
  int get score => _score;

  int _userAnsweredCorrectly = 0;
  int get userAnsweredCorrectly => _userAnsweredCorrectly;

  void init() {
    for (var item in gameQuestions.values) {
      _questions.add(Question.fromJson(item));
    }

    startGame();
    notifyListeners();
  }

  void startGame() {
    _userAnsweredCorrectly = 0;
    _question = _questions[_currentQuestion].question ?? 'N/A';
    _answer0 = _questions[_currentQuestion].answer0 ?? 'N/A';
    _answer1 = _questions[_currentQuestion].answer1 ?? 'N/A';
    _answer2 = _questions[_currentQuestion].answer2 ?? 'N/A';
    _answer3 = _questions[_currentQuestion].answer3 ?? 'N/A';
    _correctAnswer = _questions[_currentQuestion].correctAnswer ?? "N/A";
  }

  Future nextQuestion(String userAnswer) async {
    if (_questions[_currentQuestion].correctAnswer == userAnswer) {
      _score++;
      _userAnsweredCorrectly = 1;
      notifyListeners();
    } else {
      _userAnsweredCorrectly = 2;
      notifyListeners();
    }

    await Future.delayed(const Duration(seconds: 3));

    _currentQuestion++;
    startGame();
    notifyListeners();
  }

  void removeTwoFalseAnswers() {
    int random1 = 0;
    int random2 = 0;

    print("yay");

    List<String> _currentAnswers = [_answer0, _answer1, _answer2, _answer3];

    while (random1 == random2 ||
        _currentAnswers[random1] == _correctAnswer ||
        _currentAnswers[random2] == _correctAnswer) {
      random1 = Random().nextInt(4);
      random2 = Random().nextInt(4);
    }

    if (random1 == 0) {
      _answer0 = '';
    } else if (random1 == 1) {
      _answer1 = '';
    } else if (random1 == 2) {
      _answer2 = '';
    } else if (random1 == 3) {
      _answer3 = '';
    }

    if (random2 == 0) {
      _answer0 = '';
    } else if (random2 == 1) {
      _answer1 = '';
    } else if (random2 == 2) {
      _answer2 = '';
    } else if (random2 == 3) {
      _answer3 = '';
    }
    notifyListeners();
  }
}
