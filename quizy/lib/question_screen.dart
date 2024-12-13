import 'package:flutter/material.dart';
import 'package:quizy/option_button.dart';
import 'package:quizy/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelect});

  final Function(String selectedAnswer) onSelect;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionNumber = 0;

  void nextQuestion(String answer) {
    widget.onSelect(answer);

    setState(() {
      currentQuestionNumber++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionNumber];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(currentQuestion.question,
                  style: GoogleFonts.lato(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const SizedBox(height: 20),

              ...currentQuestion.shuffledAnswers().map((answer) {
                return OptionButton(
                    onClickFunction: () {
                      nextQuestion(answer);
                    },
                    text: answer);
              }),
              // //button 1
              // OptionButton(onClickFunction: () {}, text: "Answer 1"),

              // //button 1
              // OptionButton(onClickFunction: () {}, text: "Answer 2"),

              // //button 1
              // OptionButton(onClickFunction: () {}, text: "Answer 3"),

              // //button 1
              // OptionButton(onClickFunction: () {}, text: "Answer 4"),
            ]),
      ),
    );
  }
}
