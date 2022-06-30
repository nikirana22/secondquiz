import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz/provider/quiz_provider.dart';
/// Timer cases:
/// 1) A 10 sec timer should be started by default as long as the quiz lasts, which provides 2 scenarios:
/// a) Timer reaches 0 -> Next Question
/// b) User presses a button before timer ends -> A 3 sec timer should be started (check question, increase score, update ui, start 3 second timer)
/// 2) On end of either the 3 second timer or the 10 second timer the next question should be shown
/// (will need access to quiz provider for that to force next question)
///
/// Note: The 10 second timer should be "restarted" on each question &
/// 3 second timer should only be shown if the user interacts & the 10 second timer is still active
/// Task for later -> If the 10 sec timer has less than 3 seconds then don't start the 3 sec timer
/// */

class TimerProvider with ChangeNotifier{
  int time=11;
  Timer? _timer;

  void stopTimer() {
    _timer!.cancel();
  }

  void startTimer(QuizProvider quizProvider) {
    _timer = Timer.periodic(const Duration(seconds: 1), (thistimer) {
      if (time > 0) {
        time--;
        notifyListeners();
        stopTimer();
      }
      else {
        timeFinished(quizProvider);
      }
    });
  }

  void timeFinished(QuizProvider quizProvider) {
    if (quizProvider.questionIndex < quizProvider.list.length - 1) {
      quizProvider.moveToNextQuestion();
      time = 10;
    }
  }
}
