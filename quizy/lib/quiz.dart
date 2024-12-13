import 'package:flutter/material.dart';
import 'package:quizy/start_screen.dart';
import 'package:quizy/question_screen.dart';
import 'package:quizy/questions.dart';
import 'package:quizy/result_screen.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  //using an identifier instead of the init method
  var activeScreenIdentifier = 'start-screen';
  List<String> answers = [];

  //Using an IDENTIFIER doesn't require the extra init state function
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreens);
  //   super.initState();
  // }

  //Third Method to Solve This Lifting up the state problem

  void switchScreens() {
    setState(() {
      activeScreenIdentifier = 'questions-screen';
    });
  }

  void addAnswers(String selectedAnswer) {
    setState(() {
      answers.add(selectedAnswer);
      print(selectedAnswer);
      if (answers.length == questions.length) {
        print(answers);
        activeScreenIdentifier = 'result-screen';
        // answers = [];
      }
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreens);

    if (activeScreenIdentifier == 'questions-screen') {
      screenWidget = QuestionScreen(onSelect: addAnswers);
    }

    if (activeScreenIdentifier == 'result-screen') {
      screenWidget = ResultScreen(choosenAnswers: answers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 155),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          //   child: activeScreenIdentifier == "start-screen"
          //       ? StartScreen(switchScreens)
          //       : QuestionScreen(),
        ),
      ),
    );
  }
}
