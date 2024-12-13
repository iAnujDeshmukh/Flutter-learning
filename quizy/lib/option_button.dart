import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  OptionButton({required this.text, required this.onClickFunction, super.key});

  final String text;
  final void Function() onClickFunction;

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 28, 10, 59),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      onPressed: onClickFunction,
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
