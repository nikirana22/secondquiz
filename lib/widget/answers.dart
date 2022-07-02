import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/provider/timer_provider.dart';

import '../provider/quiz_provider.dart';

class Answers extends StatefulWidget {
  Answers({Key? key}) : super(key: key);

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  TimerProvider? timerProvider;
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    print('check if this is calling on every tick--------------------------');
    QuizProvider quizProvider = Provider.of<QuizProvider>(context);
    timerProvider = Provider.of<TimerProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return SizedBox(
      width: width,
      height: height * 0.35,
      child: ListView.builder(
          itemCount: (quizProvider.list[quizProvider.questionIndex]["answer"]
                  as List<String>)
              .length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  tileColor: changeTileColorOnButtonClick(
                      quizProvider.isCorrectAnswer(index),
                      index /*will allso need listview indes if we need to only change the selected btn*/) /*quizProvider.colorList[index]*/,
                  trailing: _selectedValue != null &&
                          quizProvider.isCorrectAnswer(index)
                      ? const Icon(Icons.check)
                      : const Icon(Icons.cancel_outlined),
                  /*quizProvider.iconList[index]*/
                  /*enabled: quizProvider.clickable,*/
                  title: Text(
                    (quizProvider.list[quizProvider.questionIndex]["answer"]
                        as List<String>)[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onTap: _selectedValue == null
                      ? () {
                          print('index $index');
                          _selectedValue = index;
                          quizProvider.optionSelected(timerProvider!);
                          setState(() {});
                        }
                      : null,
                ),
              ],
            );
            // );
          }),
    );
  }

  //refactor to a better name
  Color changeTileColorOnButtonClick(bool isCorrectAnswer, int index) {
    Color tileColor = Colors.white;
    /*if (_selectedValue == null) {
      tileColor = Colors.white;
    } else*/
    if (_selectedValue != null && _selectedValue == index) {
      if (isCorrectAnswer) {
        tileColor = Colors.green;
      } else {
        tileColor = Colors.red;
      }
    }
    // _selectedValue=-1;
    // _selectedValue=null;
    return tileColor;
  }
}
