import 'package:flutter/material.dart';
import 'dart:math';

//image var
var activeImage = "assets/images/dice-1.png";

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  //there is no default constructor
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(activeImage, width: 200),
        // const SizedBox(height: 20),
        TextButton(
            onPressed: rollDiceFunction,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(top: 20),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28, color: Colors.white),
            ),
            child: const Text("Hello"))
      ],
    );
  }

  void rollDiceFunction() {
    setState(() {
      var currentNumber = Random().nextInt(6) + 1;
      activeImage = "assets/images/dice-$currentNumber.png";
    });
  }
}
