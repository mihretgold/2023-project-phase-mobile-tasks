import 'package:flutter/material.dart';
import 'package:circular_counter/picture2/new_task.dart';

class NewTaskFrame extends StatelessWidget {
  const NewTaskFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: NewTask(),
      ),
    );
  }
}
