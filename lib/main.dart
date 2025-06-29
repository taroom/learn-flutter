import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'ListView Array App',
    home: ListViewArrayApp(
      data: List<String>.generate(300, (i) => "Item $i"),
    ),
  ));
}

class ListViewArrayApp extends StatelessWidget {
  const ListViewArrayApp({super.key, required this.data});

  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Array"),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.widgets),
              title: Text(data[index]),
            );
          }),
    );
  }
}
