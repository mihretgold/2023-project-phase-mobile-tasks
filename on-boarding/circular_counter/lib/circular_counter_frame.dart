import 'package:circular_counter/counter_screen.dart';
import 'package:flutter/material.dart';

class CircularCounterFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 176, 199, 219),
              Color.fromARGB(255, 183, 215, 242)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: const CircularCounter(),
        ),
      ),
    );
  }
}
