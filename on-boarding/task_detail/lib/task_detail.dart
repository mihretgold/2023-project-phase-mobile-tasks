import 'package:flutter/material.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({required this.label, super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontFamily: "Inter", fontSize: 20),
          ),
        ],
      ),
    );
  }
}
