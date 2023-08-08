import 'package:flutter/material.dart';

class NewTaskItem extends StatelessWidget {
  const NewTaskItem(
      {required this.keys,
      required this.lines,
      required this.controller,
      Key? key})
      : super(key: key);

  final TextEditingController controller;
  final int lines;
  final String keys;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 343,
      // height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 221, 217, 217)
                .withOpacity(0.5), // Set the shadow color
            spreadRadius: 2, // Set the spread radius
            blurRadius: 5, // Set the blur radius
            offset: const Offset(0, 3), // Set the shadow offset
          ),
        ],
      ),
      child: TextField(
        key: Key(keys),
        maxLines: lines,
        controller: controller, // Disable text input
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
