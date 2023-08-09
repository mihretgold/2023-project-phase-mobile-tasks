import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:todo_mobile_app/constants.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';

class TaskListFrame extends StatelessWidget {
  const TaskListFrame(
      {required this.task,
      required this.id,
      required this.text1,
      required this.date,
      required this.status,
      super.key});
  final Tasks task;
  final int id;
  final String text1;
  final String date;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 230, 227, 227)
                .withOpacity(0.5), // Set the shadow color
            spreadRadius: 2, // Set the spread radius
            blurRadius: 5, // Set the blur radius
            offset: const Offset(0, 3), // Set the shadow offset
          ),
        ],
      ),
      // child: GestureDetector(
      // onTap: () {
      //   Get.to(() => taskDetail, transition: Transition.zoom);
      // },
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, taskDetail, arguments: task);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                id.toRadixString(2),
                style: const TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 8, 4, 0),
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                    child: Text(
                      text1,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 8, 4, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      date,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 8, 4, 0),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: VerticalDivider(
                        color: status ? Colors.green : Colors.red,
                        thickness: 5,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
