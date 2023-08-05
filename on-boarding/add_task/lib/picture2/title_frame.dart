import 'package:circular_counter/picture2/new_task_item.dart';
import 'package:flutter/material.dart';

class TitleFrame extends StatelessWidget {
  const TitleFrame({required this.title,super.key});
  final String title;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(255, 127, 7, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
