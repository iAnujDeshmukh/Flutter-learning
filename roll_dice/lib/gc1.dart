import 'package:flutter/material.dart';
import 'package:roll_dice/ct1.dart';

//defining Variables
var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  //default constructor
  const GradientContainer({super.key});
  //super constructor
  @override
  Widget build(context) {
    return Container(
      //Gradient Background
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: const [
          Color.fromARGB(255, 26, 2, 80),
          Color.fromARGB(255, 45, 7, 98)
        ], begin: startAlignment, end: endAlignment),
      ),

      //Text Child
      child: const Center(child: CuteText()),
    );
  }
}
