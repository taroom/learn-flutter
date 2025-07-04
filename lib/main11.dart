import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Formulir App', home: FormApp()));
}

class FormApp extends StatefulWidget {
  const FormApp({super.key});

  @override
  State<FormApp> createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  String _gender = "";
  String _agama = "Islam";

  List<String> agama = [
    'Islam',
    'Kristen',
    'Katholik',
    'Buddha',
    'Hindu',
    'Khonghucu',
    'Kepercayaan'
  ];

  void _pilihGender(String v) {
    setState(() {
      _gender = v;
    });
  }

  void _pilihAgama(String v) {
    setState(() {
      _agama = v;
    });
  }

  // Controller
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerMotto = TextEditingController();

  void _sendData() {
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        padding: EdgeInsets.all(5),
        height: 350,
        child: Column(
          children: <Widget>[
            Text('Nama Lengkap : ${controllerName.text}'),
            Text('Password : ${controllerPassword.text}'),
            Text('Motto : ${controllerMotto.text}'),
            Text('Jenis Kelamin : $_gender'),
            Text('Agama : $_agama'),
          ],
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text("Formulir"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controllerName,
              decoration: InputDecoration(
                  hintText: "Nama Anda",
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            TextField(
              obscureText: true,
              controller: controllerPassword,
              decoration: InputDecoration(
                  hintText: "Password Anda",
                  labelText: "Password Anda",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            TextField(
              controller: controllerMotto,
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: "Motto Anda",
                  labelText: "Motto Anda",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            RadioListTile(
              value: "Laki-Laki",
              title: Text("Laki-Laki"),
              subtitle: Text("Pilih ini jika Anda Laki-Laki"),
              groupValue: _gender,
              onChanged: (String? v) {
                _pilihGender(v!);
              },
              activeColor: Colors.red,
            ),
            RadioListTile(
              value: "Perempuan",
              title: Text("Perempuan"),
              subtitle: Text("Pilih ini jika Anda Perempuan"),
              groupValue: _gender,
              onChanged: (String? v) {
                _pilihGender(v!);
              },
              activeColor: Colors.red,
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              children: [
                Text(
                  "Agama :",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                DropdownButton(
                  value: _agama,
                  items: agama.map((String x) {
                    return DropdownMenuItem(value: x, child: Text(x));
                  }).toList(),
                  onChanged: (String? value) {
                    _pilihAgama(value!);
                  },
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  _sendData();
                },
                child: Text("Kirim"))
          ],
        ),
      ),
    );
  }
}
