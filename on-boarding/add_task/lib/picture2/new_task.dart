import 'package:circular_counter/picture2/description.dart';
import 'package:circular_counter/picture2/due_date.dart';
import 'package:circular_counter/picture2/name_text.dart';
import 'package:circular_counter/picture2/new_task_item.dart';
import 'package:circular_counter/picture2/title_frame.dart';
import 'package:flutter/material.dart';

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
          const Padding(
            padding:
                EdgeInsets.fromLTRB(25, 20, 5, 10), // Add padding to the Row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFEE6F57),
                  size: 50,
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.black,
                  size: 50,
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
                  const TitleFrame(title: "Due Date"),
                  const SizedBox(
                    height: 5,
                  ),
                  const NewTaskItem(taskWidgets: DueDate()),
                  const SizedBox(
                    height: 15,
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
                                const Color.fromRGBO(255, 127, 7, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {},
                        child: const Text(
                          "Add task",
                          style: TextStyle(
                              fontSize: 20,
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
