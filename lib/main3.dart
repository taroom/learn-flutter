import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainApp(),
    title: 'Navigasi',
    routes: <String, WidgetBuilder>{
      '/HomePage': (BuildContext context) => MainApp(),
      '/SecondPage': (BuildContext context) => SecondPage()
    },
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //as activity
      appBar: AppBar(
        title: Text("Musik"),
        backgroundColor: Colors.red[300],
      ),
      body: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SecondPage');
              },
              icon: Icon(
                Icons.headphones,
                size: 50.0,
                color: Colors.red[300],
              ))),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //as activity
      appBar: AppBar(
        title: Text("Musik"),
        backgroundColor: Colors.amber[300],
      ),
      body: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/HomePage');
              },
              icon: Icon(
                Icons.speaker,
                color: Colors.amber,
                size: 50.0,
              ))),
    );
  }
}
