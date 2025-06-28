import 'package:flutter/material.dart';
import 'tabs/tab_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar Stateful',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TabExample(),
    );
  }
}
