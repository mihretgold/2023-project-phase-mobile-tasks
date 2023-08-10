import 'package:flutter/material.dart';
import 'package:todo_mobile_app/constants.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositorisImpl.dart';
import 'package:todo_mobile_app/features/todo_list/presentation/widgets/new_task/new_task_item.dart';
// import 'package:todo_mobile_app/features/todo_list/presentation/widgets/task_detail/task_frame.dart';
// import 'package:todo_mobile_app/features/todo_list/presentation/widgets/task_detail/description_frame.dart';
import 'package:todo_mobile_app/features/todo_list/presentation/widgets/task_detail/task_detail.dart';

class TaskDetailFrame extends StatefulWidget {
  const TaskDetailFrame({required this.task, super.key});
  final Tasks task;

  @override
  State<TaskDetailFrame> createState() => _TaskDetailFrameState();
}

class _TaskDetailFrameState extends State<TaskDetailFrame> {
  final TextEditingController _taskNameController = TextEditingController();

  final TextEditingController _taskDescriptionController =
      TextEditingController();

  final TextEditingController _taskDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _taskNameController.text = widget.task.title;
    _taskDescriptionController.text = widget.task.description;
    _taskDateController.text = widget.task.dueDate.toString();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/task.png'),
          const TaskDetail(label: "Title"),
          const SizedBox(
            height: 12,
          ),
          // const TaskFrame(text: "UI/UX App Design"),
          NewTaskItem(
              keys: "editTitle",
              lines: 1,
              controller: _taskNameController,
              setDate: false),
          const SizedBox(
            height: 12,
          ),
          const TaskDetail(label: "Description"),
          const SizedBox(
            height: 12,
          ),
          NewTaskItem(
              keys: "editDescription",
              lines: 4,
              controller: _taskDescriptionController,
              setDate: false),
          const SizedBox(
            height: 12,
          ),
          const TaskDetail(label: "Deadline"),
          const SizedBox(
            height: 12,
          ),

          NewTaskItem(
              keys: "editDate",
              lines: 1,
              controller: _taskDateController,
              setDate: true),
          const SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () async {
                complete();
              },
              child: const Text(
                "Completed",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 243, 120, 58),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () async {
                editTask();
              },
              child: const Text(
                "Edit task",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  void editTask() {
    String taskName = _taskNameController.text;
    String taskDescription = _taskDescriptionController.text;
    String taskDate = _taskDateController.text;
    bool status = widget.task.status;

    DateTime parsedDate = DateTime.tryParse(taskDate) ?? DateTime.now();

    if (taskName.isNotEmpty && taskDescription.isNotEmpty) {
      TaskRepositorisImpl taskManager = TaskRepositorisImpl();
      taskManager.editTask(
          widget.task, taskName, taskDescription, parsedDate, status);
    }

    Navigator.pushNamed(context, viewTask,
        arguments: {'title': taskName, 'description': taskDescription});
  }

  void complete() {
    TaskRepositorisImpl taskManager = TaskRepositorisImpl();
    taskManager.markComplete(widget.task);

    Navigator.pushNamed(context, viewTask,
        arguments: {'title': '', 'description': ''});
  }
}
