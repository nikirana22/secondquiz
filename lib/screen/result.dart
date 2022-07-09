//TODO 19/4/2022: Implement Result screen
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/provider/quiz_provider.dart';
import 'package:quiz/screen/home.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> with TickerProviderStateMixin {
  Animation<Size>? sizeAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    sizeAnimation =
        Tween<Size>(begin: const Size(10, 10), end: const Size(288, 300)).animate(
            CurvedAnimation(
                parent: animationController, curve:const Interval(0,0.5,curve: Curves.easeIn)));
    animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    QuizProvider quizProvider = Provider.of<QuizProvider>(context,listen: false);

    animationController.forward();
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              quizProvider.resetQuiz();
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          width: sizeAnimation!.value.width,
          height: sizeAnimation!.value.height,
          child: Flex(
            direction: Axis.vertical,
            children: [
              const Flexible(child:SizedBox(height: 10,)),
              Flexible(
                flex: 4,
                child: SizedBox(
                  child: Image.asset(
                    'assets/ballon.png',
                    height: sizeAnimation!.value.height,
                    width: sizeAnimation!.value.width*0.5,
                    fit: BoxFit.fill,
                    // fit: BoxFit,
                  ),
                ),
              ),
              const Flexible(
                  child: SizedBox(
                height: 10,
              )),
              const Flexible(
                flex: 2,
                child: Text(
                  'Congrats!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

             const Flexible(

                  child: SizedBox(
                height: 10,
              )),

              Flexible(
                flex: 2,
                child: Text(
                  '${(quizProvider.result / quizProvider.list.length * 100).toInt()}% Score',
                  style: const TextStyle(
                      color: Color.fromRGBO(45, 183, 128, 1), fontSize: 35),
                ),
              ),

              const Flexible(
                  child: SizedBox(
                height: 10,
              )),
              const Flexible(
                child: Text(
                  'Quiz Completed successfully.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              const Flexible(
                  child: SizedBox(
                height: 10,
              )),
              attemptAndCorrectAnswer(quizProvider),

              const Flexible(

                  child: SizedBox(
                height: 10,
              )),
              Flexible(child:  shareWith())
            ],
          ),
        ),
      ),
    );
  }


  Widget attemptAndCorrectAnswer(QuizProvider quizProvider) {
    return Flexible(
      flex: 2,

      child: RichText(
          text: TextSpan(style: const TextStyle(fontSize: 15), children: [
        const TextSpan(
            text: 'you attempt', style: TextStyle(color: Colors.black)),
        TextSpan(
            text: ' ${quizProvider.list.length} questions ',
            style: const TextStyle(color: Colors.blue)),
        const TextSpan(
            text: 'and \n from that ', style: TextStyle(color: Colors.black)),
        TextSpan(
            text: '${quizProvider.result} answer',
            style: const TextStyle(color: Colors.greenAccent)),
        const TextSpan(text: 'is correct', style: TextStyle(color: Colors.black)),
      ])),
    );
  }

  Widget shareWith() {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.center,
      direction: Axis.horizontal,
      children:  [
        const Flexible(
          flex: 4,
          child: Text(
            'Share with us : ',
            style: TextStyle(color: Colors.lightGreen),
          ),
        ),
        Flexible(
          flex: 2,
            child: Icon(Icons.email,
              size: sizeAnimation!.value.width*0.05,

            )),
        const Flexible(
          flex: 2,
          child: SizedBox(
            width: 5,
          ),
        ),
        Flexible(child: Icon(Icons.facebook,
          size: sizeAnimation!.value.width*0.05,
        )),
        
        const Flexible(
          flex: 1,
          child: SizedBox(
            width: 5,
          ),
        ),
        Flexible(
          flex: 1,
          child: Icon(
            Icons.whatsapp,
            size: sizeAnimation!.value.width*0.05,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
