import 'package:flutter/material.dart';

class NameText extends StatelessWidget {
  const NameText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            "UI/UX App Design",
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 8, 4, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
