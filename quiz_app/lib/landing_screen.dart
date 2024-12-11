import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  //default constructor
  const LandingScreen({super.key});

  //build super method
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 60, 12, 69),
      body: Center(
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
    );
  }
}
