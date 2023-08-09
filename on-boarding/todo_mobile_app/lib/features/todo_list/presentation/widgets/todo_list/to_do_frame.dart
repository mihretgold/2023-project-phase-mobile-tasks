import 'package:flutter/material.dart';
import 'package:todo_mobile_app/constants.dart';
import 'package:todo_mobile_app/features/todo_list/presentation/widgets/todo_list/task_list_frame.dart';
import 'package:get/get.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositorisImpl.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('MMMM d, yyyy');

class TodoFrame extends StatelessWidget {
  TodoFrame({super.key});
  final List<Tasks> tasks = TaskRepositorisImpl.tasks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/checkList.png'),
          const Text(
            "Tasks list",
            style: TextStyle(
                fontFamily: "Inter", fontWeight: FontWeight.bold, fontSize: 23),
          ),
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            height: 7,
          ),
          if (tasks.isEmpty)
            const Center(
              child: Text('No tasks yet'),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TaskListFrame(
                        task: tasks[index],
                        id: tasks[index].id,
                        text1: tasks[index].title,
                        date: formatter.format(tasks[index].dueDate),
                        status: tasks[index].status,
                      ),
                      const SizedBox(
                        height: 12,
                      )
                    ],
                  );
                },
              ),
            ),
          Center(
            child: SizedBox(
              width: 256,
              height: 50,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => addTask, transition: Transition.zoom);
                },
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
