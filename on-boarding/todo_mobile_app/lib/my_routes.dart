import 'package:flutter/material.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/features/todo_list/presentation/widgets/landing_page/to_do_frame.dart';
import 'package:todo_mobile_app/features/todo_list/presentation/widgets/new_task/new_task_frame.dart';
import 'package:todo_mobile_app/features/todo_list/presentation/widgets/task_detail/view_task_frame.dart';
import 'package:todo_mobile_app/features/todo_list/presentation/widgets/todo_list/view_todo_list.dart';

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const ToDoFrame());
      case '/viewTask':
        Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;
        String title = data['title'];
        String description = data['description'];

        return MaterialPageRoute(
            builder: (context) => ViewToDoList(
                values: {'title': title, 'descreption': description}));
      case '/addTask':
        return MaterialPageRoute(builder: (context) => const NewTaskFrame());
      case '/taskDetail':
        Tasks tasks = settings.arguments as Tasks;

        return MaterialPageRoute(builder: (context) => ViewTaskFrame(tasks: tasks,));
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) => const Scaffold(
        body: Text('No route defined'),
      ),
    );
  }
}
