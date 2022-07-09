import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class QuizProvider with ChangeNotifier {
  List<Map<String, Object>> list = [
    {
      'question': 'what is your name',
      'answer': ['sonu', 'Biki', 'Chiki'],
      'ans': 'Chiki',
    },
    {
      'question': 'what is your country',
      'answer': [
        'pak',
        'china',
        'india',
      ],
      'ans': 'india',
    },
    {
      'question': 'what is your favorite book',
      'answer': [
        'The Alchimest',
        'Power of habbit',
        'You can win',
      ],
      'ans': 'You can win',
    },
    {
      'question': 'How many times your have read You can win',
      'answer': [
        '1',
        '2',
        '8',
      ],
      'ans': '1',
    },
    {
      'question': 'who is the writer of Rich dad poor dad',
      'answer': [
        'Hill',
        'Robert',
        'Shiv Khera',
      ],
      'ans': 'Robert',
    },
  ];
  int _result = 0;
  int _questionIndex = 0;
  int _life = 3;
  bool shouldShowResult = false;

  int get questionIndex => _questionIndex;

  int get life => _life;

  int get result => _result;

  void next(bool shouldDecreaseLife) {
    debugPrint("questionIndex: $_questionIndex & life is: $_life");
    if (_questionIndex < list.length - 1 && _life > 0) {
      if (shouldDecreaseLife) {
        decreaseLife();
      }
      _questionIndex++;
    } else {
      shouldShowResult = true;
    }
    notifyListeners();
  }

  bool isLastQuestion() {
    return questionIndex == list.length - 1;
  }

  bool isCorrectAnswer(int index) {
    return (list[_questionIndex]["answer"] as List<String>)[index] ==
        list[_questionIndex]["ans"];
  }

  void optionSelected(int index) {
    if (isCorrectAnswer(index)) {
      _result++;
    } else {
      decreaseLife();
    }
    notifyListeners();
  }

  //This is not working, the quiz still continues after hitting 0 lifes
  void decreaseLife() {
    if (_life > 0) {
      _life--;
    } else {
      shouldShowResult = true;
    }
    debugPrint("life: $life");
  }

  void resetQuiz() {
    _result = 0;
    _questionIndex = 0;
    _life = 3;
    shouldShowResult = false;
    notifyListeners();
  }
}
