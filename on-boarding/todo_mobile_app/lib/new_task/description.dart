import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "First i have to animate the logo and later",
          style: TextStyle(
            fontSize: 15,
            color: Color.fromRGBO(14, 13, 13, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "protyping my design. It's very important.",
          style: TextStyle(
            fontSize: 15,
            color: Color.fromRGBO(9, 9, 9, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
