import 'package:flutter/material.dart';

class DueDate extends StatelessWidget {
  const DueDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 343,
      // height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "April 29, 2023 12:30 AM",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 8, 4, 0),
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
              Icon(
                Icons.calendar_month,
                color: Color.fromARGB(255, 243, 140, 89),
              )
            ],
          ),
        ),
      ),
    );
  }
}
