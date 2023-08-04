import 'package:circular_counter/counter_screen.dart';
import 'package:flutter/material.dart';

class CircularCounterFrame extends StatelessWidget {
  const CircularCounterFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Counter App'))),
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
