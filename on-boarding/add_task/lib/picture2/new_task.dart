import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding:
                EdgeInsets.fromLTRB(25, 20, 5, 10), // Add padding to the Row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFEE6F57),
                  size: 50,
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.black,
                  size: 50,
                ),
              ],
            ),
          ),
          const Text(
            "Create new task",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "InterBold"),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 208, 206, 206)
                      .withOpacity(0.5), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: const Offset(0, 3), // Offset in the x, y direction
                ),
              ],
            ),
            child: const Divider(
              // Divider color
              height: 1, // Divider height
              thickness: 1, // Divider thickness
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 50, right: 15),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Main task name",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(255, 127, 7, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 343,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 195, 190, 190)
                              .withOpacity(0.5), // Set the shadow color
                          spreadRadius: 2, // Set the spread radius
                          blurRadius: 5, // Set the blur radius
                          offset: const Offset(0, 3), // Set the shadow offset
                        ),
                      ],
                    ),
                    child: const Card(
                        child: Row(
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
                    )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50, right: 15),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Due Date",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(255, 127, 7, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 343,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 195, 190, 190)
                              .withOpacity(0.5), // Set the shadow color
                          spreadRadius: 2, // Set the spread radius
                          blurRadius: 5, // Set the blur radius
                          offset: const Offset(0, 3), // Set the shadow offset
                        ),
                      ],
                    ),
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "UI/UX App Design",
                              style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 8, 4, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.calendar_month,
                              color: Color.fromRGBO(255, 127, 7, 1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50, right: 15),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(255, 127, 7, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 343,
                    height: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 195, 190, 190)
                              .withOpacity(0.5), // Set the shadow color
                          spreadRadius: 2, // Set the spread radius
                          blurRadius: 5, // Set the blur radius
                          offset: const Offset(0, 3), // Set the shadow offset
                        ),
                      ],
                    ),
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: SizedBox(
                      width: 190,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 127, 7, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {},
                        child: const Text(
                          "Add task",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
