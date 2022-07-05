import 'package:flutter/material.dart';
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
    double width = size.width;
    Provider.of<QuizProvider>(context);
    return Selector<QuizProvider, bool>(
      selector: (_, quizProvider) {
        return quizProvider.shouldShowResult;
      },
      builder: (_, showResult, child) => showResult
          ? const Result():
                    Container(
            decoration:const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(49, 148, 244, 1),
                      Color.fromRGBO(84, 114, 236, 1),
                    ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
            ),
                child:
           Scaffold(
              backgroundColor: Colors.transparent,
              appBar: const CustomTabBar(

              ),
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
                      Consumer<QuizProvider>(
                        builder:
                            (BuildContext context, provider, Widget? child) {
                          return Text(
                            'question ${provider.questionIndex + 1} of ${provider.list.length}',
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 17),
                          );
                        },
                      ),
                      const Question(),
                      Answers()
                    ],
                  ),
                ),
              ),
            ),
      ),
    ); /*quizProvider.questionIndex >= quizProvider.list.length-1*/
  }
}
