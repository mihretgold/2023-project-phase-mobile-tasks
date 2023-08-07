import 'package:flutter/material.dart';

class DescriptionFrame extends StatelessWidget {
  const DescriptionFrame(
      {required this.text1,
      required this.text2,
      required this.text3,
      super.key});

  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 170,
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
        color: const Color(0xFFF1EEEE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 2, 0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: const TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 8, 4, 0),
                    ),
                  ),
                  Text(
                    text2,
                    style: const TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 8, 4, 0),
                    ),
                  ),
                  Text(
                    text3,
                    style: const TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 8, 4, 0),
                    ),
                  ),
                  const Text(""),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
