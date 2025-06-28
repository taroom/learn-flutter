import 'package:flutter/material.dart';

void main() {
  runApp(const HalamanCardAndParsing());
  // runApp(const HalamanRowColumn());
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

class HalamanCardAndParsing extends StatelessWidget {
  const HalamanCardAndParsing({super.key});

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
                'Card Dan Parsing',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            backgroundColor: Colors.red,
            actions: <Widget>[Icon(Icons.search)],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CardList(
                userIcon: Icons.home,
                userIconColor: Colors.red[500],
                userText: 'Home',
              ),
              CardList(
                userIcon: Icons.alarm,
                userIconColor: Colors.brown[500],
                userText: 'Alarm',
              ),
              CardList(
                userIcon: Icons.air,
                userIconColor: Colors.amber[500],
                userText: 'Air',
              ),
              CardList(
                userIcon: Icons.settings,
                userIconColor: Colors.blue[500],
                userText: 'Setting',
              ),
            ],
          )),
    );
  }
}

class CardList extends StatelessWidget {
  // const CardList({super.key});
  final IconData userIcon;
  final Color? userIconColor;
  final String userText;
  const CardList(
      {super.key,
      required this.userIcon,
      required this.userIconColor,
      required this.userText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Icon(
              userIcon,
              size: 30.0,
              color: userIconColor,
            ),
            Text(
              userText,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
