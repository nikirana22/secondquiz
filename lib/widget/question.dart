import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/quiz_provider.dart';

class Question extends StatelessWidget {
  const Question( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizProvider quizProvider = Provider.of<QuizProvider>(context);
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        // title,
        quizProvider.list[quizProvider.questionIndex]['question'] as String,
        style: const TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}