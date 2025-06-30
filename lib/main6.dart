import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  /* runApp(MaterialApp(
    title: 'ListView Array App',
    home: ListViewArrayApp(
      data: List<String>.generate(300, (i) => "Item $i"),
    ),
  )); */

  runApp(MaterialApp(title: 'ListView JSON App', home: ListViewJsonApp()));
}

/* use json */
class ListViewJsonApp extends StatefulWidget {
  const ListViewJsonApp({super.key});

  @override
  State<ListViewJsonApp> createState() => _ListViewJsonAppState();
}

class _ListViewJsonAppState extends State<ListViewJsonApp> {
  List _dataJSON = [];
  bool _isLoading = true;

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      setState(() {
        _dataJSON = json.decode(response.body);
        _isLoading = false;
      });
      return "Success";
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List View With JSON Data")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _dataJSON.length,
              itemBuilder: (context, index) {
                final data = _dataJSON[index];
                return Container(
                    padding: EdgeInsets.all(10),
                    child: Card(
                        child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['title'],
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                          Text(
                            data['body'],
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                    )));
              },
            ),
    );
  }
}

/*
 * use array
 */
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
