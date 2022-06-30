import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/answers.dart';
import '../widget/custom_tab_bar.dart';
import '../widget/question.dart';
import '../provider/quiz_provider.dart';
import '../screen/result.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    QuizProvider quizProvider = Provider.of<QuizProvider>(context, listen: false);
    return quizProvider.questionIndex >= quizProvider.list.length-1
        ? const Result()
        : Scaffold(
            appBar:const CustomTabBar(
              // time: quizProvider.time,
            ),
            backgroundColor: const Color.fromRGBO(51, 145, 243, 1),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/boat.png',
                    width: width * 0.9,
                    height: height * 0.25,
                  ),
                  Consumer<QuizProvider>(builder: (BuildContext context, provider, Widget? child) {
                    return Text(
                      'question ${provider.questionIndex + 1} of ${quizProvider.list.length}',
                      style: const TextStyle(color: Colors.white70, fontSize: 17),
                    );
                  },

                  ),
                  const Question(),
                   Answers()
                ],
              ),
            )),
          );
  }
}