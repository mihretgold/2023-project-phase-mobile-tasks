import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() {
    return _ToDoState();
  }
}

class _ToDoState extends State<ToDo> {
  void onTap() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assests/svg/to_do.svg'),
          SizedBox(
            width: 256,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C8CE9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: onTap,
              child: const Text(
                "Get Started",
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
