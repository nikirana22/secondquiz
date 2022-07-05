import 'package:flutter/material.dart';


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


  // final List<Icon> iconList = [
  //   const Icon(Icons.check_box_outline_blank),
  //   const Icon(Icons.check_box_outline_blank),
  //   const Icon(Icons.check_box_outline_blank)
  // ];
  // final List<Color> colorList = [Colors.white, Colors.white, Colors.white];
  int get questionIndex => _questionIndex;
  int get life => _life;
  int get result => _result;

  void next() {
    if (_questionIndex < list.length - 1) {
      _questionIndex++;
    } else {
      shouldShowResult = true;
    }
    notifyListeners();
  }

  // void resetButton() {
  //   _questionIndex = 0;
  //   _life=3;
  //   _result=0;
  // }

  bool isLastQuestion() {
    return questionIndex == list.length - 1;
  }

  bool isCorrectAnswer(int index) {
    return (list[_questionIndex]["answer"] as List<String>)[index] ==
        list[_questionIndex]["ans"];
  }

  void timeFinishedwithoutClick(){
    lifeDecrease();
  }

  void resultIncrease(){
    _result++;
  }
  void optionSelected(int index){
    if(isCorrectAnswer(index)){
      resultIncrease();
    }
    else{
      lifeDecrease();
    }
  }

  void lifeDecrease() {
    if (_life > 0) {
      _life--;
    }
  }
void resetQuiz(){
  _result=0;
   _questionIndex = 0;
   _life = 3;
   shouldShowResult=false;
  }
}
