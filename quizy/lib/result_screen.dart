import 'package:flutter/material.dart';
import 'package:quizy/questions.dart';
import 'package:quizy/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswers});
  final List<String> choosenAnswers;

// MAPS -> Key Value Pair
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'answer': questions[i].answers[0],
          'selection': choosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final correctAnswers = summaryData.where((data) {
      return (data['selection'] == data['answer']);
    }).length;
    final int totalQuestions = questions.length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "You go $correctAnswers out of $totalQuestions right",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          QuestionsSummary(summaryData),
          const SizedBox(height: 20),
          TextButton(
              onPressed: () {},
              child: const Text("Restart the Quiz"),
              style: TextButton.styleFrom(backgroundColor: Colors.white))
        ],
      ),
    );
  }
}
