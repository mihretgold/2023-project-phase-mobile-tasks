import 'package:flutter/material.dart';
import 'package:todo_mobile_app/constants.dart';
import 'package:todo_mobile_app/landing_page/to_do_frame.dart';
import 'package:todo_mobile_app/my_routes.dart';
// import 'package:todo_mobile_app/new_task/new_task_frame.dart';
// import 'package:todo_mobile_app/task_detail/view_task_frame.dart';
// import 'package:todo_mobile_app/todo_list/view_todo_list.dart';
// import 'package:todo_mobile_app/landing_page/to_do_frame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To Do Mobile App",
      theme: ThemeData(useMaterial3: true),
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: home,
    );
  }
}
