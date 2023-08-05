import 'package:circular_counter/picture1/to_do.dart';
import 'package:flutter/material.dart';

class ToDoFrame extends StatelessWidget {
  const ToDoFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFEE6F57),
          ),
          child: const ToDo(),
        ),
      ),
    );
  }
}
