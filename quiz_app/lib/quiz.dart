import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  //default constructor
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF02AABD), Color(0xFF00CDAC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/quiz-logo.png', width: 250),
              const SizedBox(height: 20),
              const Text(
                "Learn FLutter the fun way!",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                onPressed: () {},
                label: const Text("Press Me",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
