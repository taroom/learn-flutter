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
        title: const Text(
          'Daftar Tutorial',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: <Widget>[
          ListViewData(
              imgUrlContent:
                  'https://juststickers.in/wp-content/uploads/2016/03/html5-css3-coaster.png',
              textContent: 'CSS 3'),
          ListViewData(
              imgUrlContent:
                  'https://juststickers.in/wp-content/uploads/2014/05/Wordpress-Shape-Cut.png',
              textContent: 'Wordpress'),
          ListViewData(
              imgUrlContent:
                  'https://juststickers.in/wp-content/uploads/2014/05/Tux-Shape-Cut.png',
              textContent: 'Linux'),
        ],
      ),
    ));
  }
}

class ListViewData extends StatelessWidget {
  final String imgUrlContent;
  final String textContent;
  const ListViewData(
      {super.key, required this.imgUrlContent, required this.textContent});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20)),
          Image(
            image: NetworkImage(imgUrlContent),
            width: 50,
          ),
          Padding(padding: EdgeInsets.all(5)),
          Center(
            child: Column(
              children: <Widget>[
                Text(
                  textContent,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Ini adalah deskripsi dari : $textContent',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );

    /* return Center(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20)),
          Image(
            image: NetworkImage(imgUrlContent),
            width: 200,
          ),
          Text(
            textContent,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    ); */
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
