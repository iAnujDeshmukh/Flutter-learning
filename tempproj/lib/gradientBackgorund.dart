import 'package:flutter/material.dart';
import 'package:tempproj/dice_roller.dart';

// import 'package:roll_dice/center_text.dart'; // Ensure this import is correct

//variables
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

void rollDice() {}

class GradientBackground extends StatelessWidget {
  //Class Variables
  // Color startGradientColour = Color.fromARGB(255, 26, 2, 80);
  // Color endGradientColour = Color.fromARGB(255, 45, 7, 98);

  //List approach
  final List<Color> colours;

  //default constructor
  const GradientBackground({super.key, required this.colours});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colours,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(child: DiceRoller()),
    );
  }
}
