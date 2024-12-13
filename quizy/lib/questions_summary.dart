import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 680, // Set the height for the widget
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400), // Limit width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: summaryData.map((data) {
                // Determine background color based on correctness
                final bool isCorrect = (data['answer'] == data['selection']);
                final Color backgroundColor =
                    isCorrect ? Colors.green.shade100 : Colors.red.shade100;

                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8), // Add spacing between rows
                  padding: const EdgeInsets.all(12), // Add padding inside rows
                  decoration: BoxDecoration(
                    color: backgroundColor, // Set background color
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question Number with Background
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 16), // Spacing between number and content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Question: ${(data['question']) as String}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Correct Answer: ${(data['answer']).toString()}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Your Choice: ${(data['selection']).toString()}',
                              style: TextStyle(
                                fontSize: 14,
                                color: isCorrect ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
