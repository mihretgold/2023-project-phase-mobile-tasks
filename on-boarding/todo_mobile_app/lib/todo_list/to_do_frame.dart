import 'package:flutter/material.dart';
import 'package:todo_mobile_app/constants.dart';
import 'package:todo_mobile_app/todo_list/task_list_frame.dart';

class TodoFrame extends StatelessWidget {
  const TodoFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/checkList.png'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Tasks list",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const TaskListFrame(
              letter: "U",
              text1: "UI/UX App",
              text2: "Design",
              date: "April. 29, 2023",
              color: "red"),
          const SizedBox(
            height: 7,
          ),
          const TaskListFrame(
              letter: "U",
              text1: "UI/UX App",
              text2: "Design",
              date: "April. 29, 2023",
              color: "green"),
          const SizedBox(
            height: 7,
          ),
          const TaskListFrame(
              letter: "V",
              text1: "View candidates'",
              text2: "",
              date: "April. 29, 2023",
              color: "yellow"),
          const SizedBox(
            height: 7,
          ),
          const TaskListFrame(
              letter: "F",
              text1: "Football Cu",
              text2: "Drybling",
              date: "April. 29, 2023",
              color: "red"),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 256,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEE6F57),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                Navigator.pushNamed(context, addTask);
              },
              child: const Text(
                "Create task",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
