import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello World! Nama Saya Agus Sutarom',
            style: TextStyle(
                fontSize: 20.0, color: Colors.amber, fontFamily: 'Arial'),
          ),
        ),
      ),
    );
  }
}
