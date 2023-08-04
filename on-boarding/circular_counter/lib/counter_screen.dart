import 'package:flutter/material.dart';

class CircularCounter extends StatefulWidget {
  const CircularCounter({super.key});

  @override
  State<CircularCounter> createState() {
    return _CircularCounterState();
  }
}

class _CircularCounterState extends State<CircularCounter> {
  int counter = 0;
  String counterString = '0';

  void decreament() {
    setState(() {
      if (counter == 0) {
        counter = 10;
      } else {
        counter--;
      }
      counterString = counter.toString();
    });
  }

  void increament() {
    setState(() {
      if (counter == 10) {
        counter = 0;
      } else {
        counter++;
      }
      counterString = counter.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          counterString,
          style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 53, 119, 172)),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: increament,
              icon: const Icon(Icons.add),
              label: const Text(''),
            ),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton.icon(
              onPressed: decreament,
              icon: const Center(child: Icon(Icons.minimize)),
              label: const Text(''),
            )
          ],
        )
      ]),
    );
  }
}
