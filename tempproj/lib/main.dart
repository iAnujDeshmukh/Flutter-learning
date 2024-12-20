import 'package:flutter/material.dart';
import 'package:tempproj/gradientBackgorund.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
          body: GradientBackground(colours: [Colors.red, Colors.white])),
    ),
  );
}
