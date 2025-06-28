import 'package:flutter/material.dart';

class SmartPhone extends StatefulWidget {
  const SmartPhone({super.key});

  @override
  State<SmartPhone> createState() => _SmartPhoneState();
}

class _SmartPhoneState extends State<SmartPhone> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20)),
          Text(
            "Smart Phone",
            style: TextStyle(fontSize: 30),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Image.asset(
            'img/smartphone.jpg',
            width: 200,
          )
        ],
      ),
    );
  }
}
