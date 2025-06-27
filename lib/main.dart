import 'package:flutter/material.dart';

void main() {
  runApp(const HalamanRowColumn());
  // runApp(const Halaman1());
  // runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //as activity
        body: Center(
          child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepPurple),
              child: Center(
                child: Text(
                  'Agus Sutarom',
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Serif", fontSize: 20.0),
                ),
              )),
        ),
      ),
    );
  }
}

class Halaman1 extends StatelessWidget {
  const Halaman1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agus Sutarom App',
      home: Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Center(
            child: Text(
              'Agus Sutarom',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          backgroundColor: Colors.red,
          actions: <Widget>[Icon(Icons.search)],
        ),
        body: Center(
          child: Text('Halaman'),
        ),
      ),
    );
  }
}

class HalamanRowColumn extends StatelessWidget {
  const HalamanRowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halaman Ke 2',
      home: Scaffold(
          backgroundColor: Colors.yellow[200],
          appBar: AppBar(
            leading: Icon(Icons.home),
            title: Center(
              child: Text(
                'Agus Sutarom',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            backgroundColor: Colors.red,
            actions: <Widget>[Icon(Icons.search)],
          ),
          body: Column(
            children: <Widget>[
              Icon(Icons.local_pizza),
              Row(
                children: <Widget>[
                  Icon(Icons.accessibility),
                  Icon(Icons.access_alarm),
                  Icon(Icons.account_balance),
                ],
              ),
              Icon(Icons.account_balance),
            ],
          )),
    );
  }
}
