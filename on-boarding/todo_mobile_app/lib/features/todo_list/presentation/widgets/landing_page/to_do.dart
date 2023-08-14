import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_mobile_app/constants.dart';
import 'package:get/get.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() {
    return _ToDoState();
  }
}

class _ToDoState extends State<ToDo> {
  void onTap() {
    Navigator.pushNamed(context, viewTask, arguments: {
      'title': '',
      'description': '',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/to_do.svg'),
          SizedBox(
            width: 256,
            height: 50,
            child: GestureDetector(
              onTap: () {
                Get.to(() => viewTask, transition: Transition.zoom);
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C8CE9),
                    foregroundColor: Colors.white,
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
            ),
          )
        ],
      ),
    );
  }
}
