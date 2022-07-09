import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../provider/quiz_provider.dart';
import '../screen/result.dart';
import '../widget/answers.dart';
import '../widget/custom_tab_bar.dart';
import '../widget/question.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    return Selector<QuizProvider, bool>(
      selector: (_, quizProvider) {
        return quizProvider.shouldShowResult;
      },
      builder: (_, showResult, child) => showResult
          ? const Result()
          : Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(49, 148, 244, 1),
                  Color.fromRGBO(84, 114, 236, 1),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: const CustomTabBar(),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        'assets/banner.svg',
                        height: height * 0.25,
                        fit: BoxFit.cover,
                      ),
                      const Question(),
                      const Answers(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
