import 'package:flutter/material.dart';

class RadioHead extends StatefulWidget {
  const RadioHead({super.key});

  @override
  State<RadioHead> createState() => _RadioHeadState();
}

class _RadioHeadState extends State<RadioHead> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20)),
          Text(
            "Radio",
            style: TextStyle(fontSize: 30),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Icon(
            Icons.radio,
            size: 90,
          )
        ],
      ),
    );
  }
}
