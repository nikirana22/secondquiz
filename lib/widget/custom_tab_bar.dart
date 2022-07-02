import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/provider/quiz_provider.dart';
import 'package:quiz/provider/timer_provider.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    double height=size.height;
    double width=size.width;
    // timerprovider=Provider.of<TimerProvider>(context);

    QuizProvider quizProvider=Provider.of<QuizProvider>(context,listen: false);

    return Container(
      height: height*0.15,
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.cancel_outlined,
            color: Colors.white60,
            size: 35,
          ),
          Container(
            height:height*0.09,
            width: width*0.2,
            decoration: const BoxDecoration(
              // color: Colors.red,
              shape: BoxShape.circle,
              border: BorderDirectional(),
            ),
            child: Center(
              child: Consumer<TimerProvider>(
                builder: (_,timerProvider,child){
                  timerProvider.startTimer(quizProvider);
                  //todo we can call the quiz provider from here as well
                  // if(timerProvider.time>0){
                  //   quizProvider.moveToNextQuestion();
                  // }
                  return Text(
                    timerProvider.time.toString(),
                    style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
          ),
          Row(
            children:const [
              Icon(
                Icons.heart_broken,
                color: Colors.white70,
                size: 20,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '{quiz.life}',
                style:TextStyle(fontSize: 19, color: Colors.white70),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>const Size.fromHeight(150);
}

