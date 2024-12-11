import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(

          //Center the content
          mainAxisSize: MainAxisSize.min,

          //CHILDREN
          children: [
            //HERO IMAGE
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
              color: Colors.white.withOpacity(0.5),
            ),

            //HERO TEXT
            const SizedBox(height: 20),
            const Text(
              "Learn Flutter the fun way!",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),

            //START BUTTON
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: startQuiz,
              icon: Icon(Icons.arrow_right_alt),
              label: const Text("Start the Quiz!",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
          ]),
    );
  }
}
