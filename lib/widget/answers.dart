import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/provider/timer_provider.dart';

import '../provider/quiz_provider.dart';

class Answers extends StatefulWidget {
  const Answers({Key? key}) : super(key: key);

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    QuizProvider quizProvider = Provider.of<QuizProvider>(context);
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.35,
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
                Selector<TimerProvider, bool>(
                  selector: (_, provider) => provider.isTimeOver(),
                  builder: (_, timeOver, child) {
                    if (timeOver) {
                      _selectedValue = null;
                    }
                    return ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      tileColor: changeTileColorOnButtonClick(
                          quizProvider.isCorrectAnswer(index), index),
                      trailing: changeTileIconOnButtonClick(
                          quizProvider.isCorrectAnswer(index), index),
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
                              final timerProvider = Provider.of<TimerProvider>(
                                  context,
                                  listen: false);
                              _selectedValue = index;
                              quizProvider.optionSelected(index);
                              timerProvider.switchTimerState(
                                  TIMER_STATE.threeSecondTimer);
                            }
                          : null,
                    );
                  },
                ),
              ],
            );
          }),
    );
  }

  //Could jst return IconData but it's fine
  Icon changeTileIconOnButtonClick(bool isCorrectAnswer, int index) {
    Icon icon = const Icon(Icons.check_box_outline_blank);
    if (_selectedValue != null && _selectedValue == index) {
      if (isCorrectAnswer) {
        icon = const Icon(
          Icons.check,
          color: Colors.white,
        );
      } else {
        icon = const Icon(Icons.cancel_outlined);
      }
    }
    return icon;
  }

  //refactor to a better name
  Color changeTileColorOnButtonClick(bool isCorrectAnswer, int index) {
    Color tileColor = Colors.white;

    if (_selectedValue != null && _selectedValue == index) {
      if (isCorrectAnswer) {
        tileColor = const Color.fromRGBO(203, 199, 4, 1);
      } else {
        tileColor = Colors.red;
      }
    }
    return tileColor;
  }
}
