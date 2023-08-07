import 'package:flutter/material.dart';
import 'package:todo_mobile_app/landing_page/to_do_frame.dart';
import 'package:todo_mobile_app/new_task/new_task_frame.dart';
import 'package:todo_mobile_app/task_detail/view_task_frame.dart';
import 'package:todo_mobile_app/todo_list/view_todo_list.dart';

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
        return MaterialPageRoute(builder: (context) => const ViewTaskFrame());
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) => const Scaffold(
        body: Text('No route defined'),
      ),
    );
  }
}
