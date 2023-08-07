import 'package:flutter/material.dart';
import 'package:todo_mobile_app/constants.dart';
import 'package:todo_mobile_app/todo_list/to_do_frame.dart';

class ViewToDoList extends StatelessWidget {
  const ViewToDoList({required this.values, super.key});
  final Map<String, dynamic> values;

  @override
  Widget build(BuildContext context) {
    String title = values['title'] ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Todo List $title",
            style: const TextStyle(
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
              Navigator.pushNamed(context, home);
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
      body: const TodoFrame(),
    );
  }
}
