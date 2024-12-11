import 'package:flutter/material.dart';
import 'dart:math';

class GradientBackgroundStateful extends StatefulWidget {
  @override
  State<GradientBackgroundStateful> createState() {
    return _GradientColourStatefulState();
  }
}

class _GradientColourStatefulState extends State<GradientBackgroundStateful> {
  var randomNumber1 = Random().nextInt(255);
  var randomNumber2 = Random().nextInt(255);
  var randomNumber3 = Random().nextInt(255);

  void changeColor() {
    setState(() {
      randomNumber1 = Random().nextInt(255);
      randomNumber2 = Random().nextInt(255);
      randomNumber3 = Random().nextInt(255);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, randomNumber1, randomNumber2, randomNumber3),
      child: Center(
        child: TextButton(
          onPressed: () {
            changeColor();
            print("Button Pressed!");
          },
          child: Text("Press me"),
        ),
      ),
    );
  }
}
