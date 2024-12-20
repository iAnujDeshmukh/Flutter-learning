import 'package:flutter/material.dart';
import 'package:colour_changing_button/gradientColourstateful.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
          body:
              //custom Widget
              GradientBackgroundStateful()),
    ),
  );
}
