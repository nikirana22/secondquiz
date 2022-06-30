import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/provider/quiz_provider.dart';
import 'package:quiz/provider/timer_provider.dart';
import 'package:quiz/screen/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return TimerProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return QuizProvider();
        })
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      // todo :- how can we change the color of listtile on click()
      //todo :- how can we increase app size from AppBar class
      //todo :- AppBar class has an overrided method but this class(Overrided method ) is not returning anything
    );
  }
}
