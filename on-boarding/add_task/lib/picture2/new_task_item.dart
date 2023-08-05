import 'package:flutter/material.dart';

class NewTaskItem extends StatelessWidget {
  const NewTaskItem({required this.taskWidgets, super.key});
  final Widget taskWidgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 195, 190, 190)
                .withOpacity(0.5), // Set the shadow color
            spreadRadius: 2, // Set the spread radius
            blurRadius: 5, // Set the blur radius
            offset: const Offset(0, 3), // Set the shadow offset
          ),
        ],
      ),
      child: Card(
        child: taskWidgets,
      ),
    );
  }
}
