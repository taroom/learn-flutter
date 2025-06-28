import 'package:flutter/material.dart';

class Headset extends StatefulWidget {
  const Headset({super.key});

  @override
  State<Headset> createState() => _HeadsetState();
}

class _HeadsetState extends State<Headset> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20)),
          Text(
            "HeadSet",
            style: TextStyle(fontSize: 30),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Image.asset(
            'img/headset.jpg',
            width: 400,
          )
        ],
      ),
    );
  }
}
