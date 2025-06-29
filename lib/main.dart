import 'package:flutter/material.dart';
import 'tabs/tab_example.dart';

void main() {
  runApp(const ListViewApp());
  // runApp(const TabBarApp());
}

class ListViewApp extends StatelessWidget {
  const ListViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('ListView Stateful'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.speaker),
            title: Text("Speaker"),
          ),
          ListTile(
            leading: Icon(Icons.radio),
            title: Text("Radio"),
          ),
          ListTile(
            leading: Icon(Icons.smartphone),
            title: Text("Smart Phone"),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text("Alarm"),
          ),
          ListTile(
            leading: Icon(Icons.air),
            title: Text("Air"),
          ),
        ],
      ),
    ));
  }
}

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar Stateful',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TabExample(),
    );
  }
}
