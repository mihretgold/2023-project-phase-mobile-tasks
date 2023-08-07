import 'package:flutter/material.dart';
import 'package:todo_mobile_app/constants.dart';
import 'package:todo_mobile_app/new_task/description.dart';
import 'package:todo_mobile_app/new_task/due_date.dart';
import 'package:todo_mobile_app/new_task/name_text.dart';
import 'package:todo_mobile_app/new_task/new_task_item.dart';
import 'package:todo_mobile_app/new_task/title_frame.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                25, 20, 5, 10), // Add padding to the Row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, viewTask, arguments: {
                      'title': 'Sample Title',
                      'description': 'Sample Description',
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFEE6F57),
                    size: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '');
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "Create new task",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "InterBold"),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 208, 206, 206)
                      .withOpacity(0.5), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: const Offset(0, 3), // Offset in the x, y direction
                ),
              ],
            ),
            child: const Divider(
              // Divider color
              height: 1, // Divider height
              thickness: 1, // Divider thickness
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const TitleFrame(title: "Main task name"),
                  const SizedBox(
                    height: 5,
                  ),
                  //
                  const NewTaskItem(taskWidgets: NameText()),
                  const SizedBox(
                    height: 15,
                  ),
                  //
                  const TitleFrame(title: "Due date"),
                  const SizedBox(
                    height: 5,
                  ),
                  const NewTaskItem(taskWidgets: DueDate()),
                  const SizedBox(
                    height: 45,
                  ),
                  const TitleFrame(title: "Description"),
                  const SizedBox(
                    height: 5,
                  ),
                  const NewTaskItem(taskWidgets: Description()),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: SizedBox(
                      width: 190,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 243, 120, 58),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '');
                        },
                        child: const Text(
                          "Add task",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
