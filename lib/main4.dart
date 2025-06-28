import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Tab Bar',
    home: TabBarExample(),
  ));
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Sederhana'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Ini halaman Home')),
            Center(child: Text('Ini halaman Profile')),
            Center(child: Text('Ini halaman Settings')),
          ],
        ),
      ),
    );
  }
}
