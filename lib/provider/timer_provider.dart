import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/quiz_provider.dart';

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

enum TIMER_STATE {
  tenSecondTimerState,
  threeSecondTimer,
}

extension TimerStateExtension on TIMER_STATE {
  int get value {
    switch (this) {
      case TIMER_STATE.tenSecondTimerState:
        return 10;
      case TIMER_STATE.threeSecondTimer:
        return 3;
    }
  }
}

class TimerProvider with ChangeNotifier {
  Timer? _timer;
  BuildContext context;
  TIMER_STATE _timerState = TIMER_STATE.tenSecondTimerState;
  late int time = _timerState.value;

  TimerProvider({required this.context});

  void stopCurrentTimer() {
    _timer?.cancel();
    _timer = null;
    _timerState = TIMER_STATE.tenSecondTimerState;
    time = _timerState.value;
  }

  //TODO: need to test

  void switchTimerState(TIMER_STATE timerState) {
    if(timerState != _timerState) {
      stopCurrentTimer();
      _timerState = timerState;
      time = timerState.value;
      initTimer();
    }
  }

  void _resetTimer() {
    stopCurrentTimer();
    initTimer();
  }

  /// Managing both timer here for both Ten second as well as three second
  /// since there will only be one timer at a time
  ///
  /// @author: Ehtishaam

  void initTimer() {
    stopCurrentTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time > 0) {
        notifyListeners();
        time--;
      } else {
        onTimeFinished();
      }
    });
  }

  void onTimeFinished() {
    var provider = Provider.of<QuizProvider>(context, listen: false);
    if (provider.isLastQuestion()) {
      stopCurrentTimer();
    } else {
      _resetTimer();
    }
    provider.next();
  }

  double get currentCountDownPercent {
    return (1 - (time / _timerState.value));
  }
}