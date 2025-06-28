import 'package:flutter/material.dart';

class Computer extends StatefulWidget {
  const Computer({super.key});

  @override
  State<Computer> createState() => _ComputerState();
}

class _ComputerState extends State<Computer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20)),
          Text(
            "Computer",
            style: TextStyle(fontSize: 30),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Image.asset(
            'img/computer.jpg',
            width: 200,
          )
        ],
      ),
    );
  }
}
