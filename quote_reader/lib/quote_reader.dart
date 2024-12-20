import 'package:flutter/material.dart';
import 'dart:math';

class QuoteReader extends StatefulWidget {
  const QuoteReader({super.key});

  @override
  State<QuoteReader> createState() {
    return _QuoteReaderState();
  }
}

class _QuoteReaderState extends State<QuoteReader> {
  List<String> quotesList = ["A", "B", "C", "D"];
  List<Color> coloursList = [
    Colors.blue.shade50,
    Colors.red.shade100,
    Colors.deepPurple.shade100,
  ];

  int randomQuoteIndex = 0;
  int randomColorIndex = 0;

  void changeQuoteAndColor() {
    setState(() {
      randomQuoteIndex = Random().nextInt(quotesList.length);
      randomColorIndex = Random().nextInt(coloursList.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: changeQuoteAndColor,
          child: Container(
            width: 200,
            height: 200,
            color: coloursList[randomColorIndex],
            child: Center(
              child: Text(
                quotesList[randomQuoteIndex],
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
