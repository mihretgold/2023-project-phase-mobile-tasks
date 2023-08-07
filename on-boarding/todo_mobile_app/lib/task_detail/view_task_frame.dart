import 'package:flutter/material.dart';
import 'package:todo_mobile_app/constants.dart';
import 'package:todo_mobile_app/task_detail/task_detail_frame.dart';

class ViewTaskFrame extends StatelessWidget {
  const ViewTaskFrame({super.key});
  // final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Task Detail",
            style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              fontSize: 19,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFEE6F57),
              size: 40,
            ),
            onPressed: () {
              Navigator.pushNamed(context, viewTask, arguments: {
                  'title': 'Sample Title',
                  'description': 'Sample Description',
                }, );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '');
              },
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 45,
              ),
            ),
          ),
        ],
      ),
      body: const TaskDetailFrame(),
    );
  }
}
