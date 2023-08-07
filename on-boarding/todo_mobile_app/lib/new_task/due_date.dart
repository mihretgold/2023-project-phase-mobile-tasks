import 'package:flutter/material.dart';

class DueDate extends StatelessWidget {
  const DueDate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "April 29, 2023 12:30 AM",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 8, 4, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.calendar_month,
            color: Color.fromARGB(255, 243, 140, 89),
          )
        ],
      ),
    );
  }
}
