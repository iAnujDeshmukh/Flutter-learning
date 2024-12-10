import "package:flutter/material.dart";

class CenterText extends StatelessWidget {
  //class Variable
  String text;

  CenterText(this.text, {super.key});

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 28, color: Colors.white),
    );
  }
}
