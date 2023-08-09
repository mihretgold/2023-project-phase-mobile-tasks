import 'package:todo_mobile_app/features/todo_list/presentation/widgets/landing_page/to_do.dart';
import 'package:flutter/material.dart';

class ToDoFrame extends StatelessWidget {
  const ToDoFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFEE6F57),
        ),
        child: const ToDo(),
      ),
    );
  }
}
