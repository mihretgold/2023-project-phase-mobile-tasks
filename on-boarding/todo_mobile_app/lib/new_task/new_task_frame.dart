import 'package:flutter/material.dart';
import 'package:todo_mobile_app/new_task/new_task.dart';
// import 'package:todo_mobile_app/models/task.dart';

class NewTaskFrame extends StatelessWidget {
  const NewTaskFrame({super.key});
  // final List<Task> tasks;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewTask(),
    );
  }
}
