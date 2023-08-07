import 'package:flutter/material.dart';
import 'package:todo_mobile_app/task_detail/task_frame.dart';
import 'package:todo_mobile_app/task_detail/description_frame.dart';
import 'package:todo_mobile_app/task_detail/task_detail.dart';

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
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 190,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 243, 120, 58),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Edit task",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
