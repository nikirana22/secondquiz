import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/quiz_provider.dart';
import '../provider/timer_provider.dart';
import '../screen/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return QuizProvider();
        }),
        ChangeNotifierProvider(create: (ctx) {
          return TimerProvider(context: ctx);
        }),
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
      title: 'Quiz',
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
