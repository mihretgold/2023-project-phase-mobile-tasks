import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NewTaskItem extends StatefulWidget {
  const NewTaskItem(
      {required this.keys,
      required this.lines,
      required this.controller,
      required this.setDate,
      required this.add,
      Key? key})
      : super(key: key);

  final TextEditingController controller;
  final int lines;
  final String keys;
  final bool setDate;
  final bool add;

  @override
  State<NewTaskItem> createState() => _NewTaskItemState();
}

class _NewTaskItemState extends State<NewTaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 343,
      // height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: widget.add ? Colors.white : Color.fromARGB(255, 215, 213, 213),
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
      child: TextField(
        key: Key(widget.keys),
        maxLines: widget.lines,
        controller: widget.controller, // Disable text input
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(20),
          suffixIcon: widget.setDate
              ? const Icon(
                  Icons.calendar_month,
                  color: Color.fromRGBO(243, 140, 89, 1),
                )
              : null,
        ),
        // if (setDate)
        onTap: widget.setDate
            ? () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    widget.controller.text =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                  });
                }
              }
            : null,
      ),
    );
  }
}
