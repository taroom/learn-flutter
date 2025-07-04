import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'SnackBar dan Alert App', home: SnackBarApp()));
}

class SnackBarApp extends StatefulWidget {
  const SnackBarApp({super.key});

  @override
  State<SnackBarApp> createState() => _SnackBarAppState();
}

class _SnackBarAppState extends State<SnackBarApp> {
  // set variable for save text
  String inputText = '';
  TextEditingController tEditingcontroller = TextEditingController();
  TextEditingController tAlertEditingcontroller = TextEditingController();
  TextEditingController tSnackBarEditingcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    alertOnPress(String str) {
      if (str.isEmpty) return;
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text('Alert'),
                content: Text('Anda mengetikkan $str'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'))
                ],
              ));
    }

    void snackBarFunc(String str) {
      if (str.isEmpty) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Anda mengetikkan $str'),
          duration: Duration(seconds: 3),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Input Text, Alert Widget and Snackbar',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            TextField(
              controller: tEditingcontroller,
              decoration:
                  InputDecoration(hintText: "Bisa tuliskan nama Anda disini?"),
              onSubmitted: (String txt) {
                setState(() {
                  inputText = '$txt\n$inputText';
                  tEditingcontroller.text = "";
                });
              },
            ),
            Text(
              inputText,
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: tAlertEditingcontroller,
              decoration: InputDecoration(
                  hintText: "Bisa tuliskan nama Anda disini untuk Alert?"),
              onSubmitted: (String txt) {
                tAlertEditingcontroller.text = '';
                alertOnPress(txt);
              },
            ),
            TextField(
              controller: tSnackBarEditingcontroller,
              decoration: InputDecoration(
                  hintText: "Bisa tuliskan nama Anda disini untuk Snack Bar?"),
              onSubmitted: (String txt) {
                tSnackBarEditingcontroller.text = '';
                snackBarFunc(txt);
              },
            ),
          ],
        ),
      ),
    );
  }
}
