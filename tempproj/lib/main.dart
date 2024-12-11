import 'package:flutter/material.dart';
import 'package:tempproj/gradientBackgorund.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          body: GradientBackground(colours: const [Colors.red, Colors.white])),
    ),
  );
}
