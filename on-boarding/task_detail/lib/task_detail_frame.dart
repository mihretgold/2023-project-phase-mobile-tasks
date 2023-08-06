import 'package:flutter/material.dart';
import 'package:task_detail/Description_frame.dart';
import 'package:task_detail/task_detail.dart';
import 'package:task_detail/task_frame.dart';

class TaskDetailFrame extends StatelessWidget {
  const TaskDetailFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/task.png'),
          const TaskDetail(label: "Title"),
          const SizedBox(
            height: 12,
          ),
          const TaskFrame(text: "UI/UX App Design"),
          const SizedBox(
            height: 12,
          ),
          const TaskDetail(label: "Description"),
          const DescriptionFrame(
              text1: "First I have to animate the logo",
              text2: "and prototyping my design. It's",
              text3: "very important"),
          const SizedBox(
            height: 12,
          ),
          const TaskDetail(label: "Deadline"),
          const TaskFrame(text: "April. 29, 2023"),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
