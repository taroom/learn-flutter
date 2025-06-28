import 'package:flutter/material.dart';
import 'computer.dart';
import 'headset.dart';
import 'radio.dart';
import 'smartphone.dart';

class TabExample extends StatefulWidget {
  const TabExample({super.key});

  @override
  State<TabExample> createState() => _TabExampleState();
}

class _TabExampleState extends State<TabExample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar dengan StatefulWidget'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.computer), text: 'Computer'),
              Tab(icon: Icon(Icons.headset), text: 'Headset'),
              Tab(icon: Icon(Icons.radio), text: 'Radio'),
              Tab(icon: Icon(Icons.smartphone), text: 'Smart Phone'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Computer(),
            Headset(),
            RadioHead(),
            SmartPhone(),
          ],
        ),
      ),
    );
  }
}
