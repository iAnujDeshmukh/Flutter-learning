import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class QuestionScreen extends StatefulWidget {
  //default constructor
  const QuestionScreen({super.key});

  //create State method
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

void temp() {}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(context) {
    return const Center(
      child: Column(children: [
        Text(
            "Empower conversations with best-in-class communication API Full-feature"),
        OutlinedButton(onPressed: temp, child: Text("option 1")),
        OutlinedButton(onPressed: temp, child: Text("option 2")),
        OutlinedButton(onPressed: temp, child: Text("option 3")),
        OutlinedButton(onPressed: temp, child: Text("option 4"))
      ]),
    );
  }
}
