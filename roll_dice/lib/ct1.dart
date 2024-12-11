import 'package:flutter/material.dart';

class CuteText extends StatelessWidget {
  //default constructor
  const CuteText({super.key});

  //super Constructor
  @override
  Widget build(context) {
    return const Text(
      "Hello anuj",
      style: TextStyle(fontSize: 28, color: Colors.white),
    );
  }
}
