import 'package:flutter/material.dart';
import 'package:quote_reader/quote_reader.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: QuoteReader(),
      ),
    ),
  );
}
