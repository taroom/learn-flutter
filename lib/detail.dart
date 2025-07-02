import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String nama;
  final String gambar;
  const Detail({super.key, required this.nama, required this.gambar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User : $nama"),
        backgroundColor: Colors.red[700],
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Center(
          child: Image(image: NetworkImage(gambar)),
        ),
      ),
    );
  }
}
