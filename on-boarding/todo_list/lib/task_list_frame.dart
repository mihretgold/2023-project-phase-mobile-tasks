import 'package:flutter/material.dart';

Map<String, Color> colorMap = {
  'red': Colors.red,
  'green': Colors.green,
  'yellow': Colors.yellow,
};

class TaskListFrame extends StatelessWidget {
  const TaskListFrame(
      {required this.letter,
      required this.text1,
      required this.text2,
      required this.date,
      required this.color,
      super.key});
  final String letter;
  final String text1;
  final String text2;
  final String date;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 230, 227, 227)
                .withOpacity(0.5), // Set the shadow color
            spreadRadius: 2, // Set the spread radius
            blurRadius: 5, // Set the blur radius
            offset: const Offset(0, 3), // Set the shadow offset
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 2, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                letter,
                style: const TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 8, 4, 0),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                    child: Text(
                      text1,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 8, 4, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    text2,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 8, 4, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      date,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 8, 4, 0),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 7, 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: VerticalDivider(
                        color: colorMap[color],
                        thickness: 5,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
