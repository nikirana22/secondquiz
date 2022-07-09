import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/quiz_provider.dart';

class Question extends StatelessWidget {
  const Question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizProvider quizProvider = Provider.of<QuizProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'question ${quizProvider.questionIndex + 1} of ${quizProvider.list.length}',
          style: const TextStyle(color: Colors.white70, fontSize: 17),
        ),
        Text(
          // title,
          quizProvider.list[quizProvider.questionIndex]['question'] as String,
          style: const TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}