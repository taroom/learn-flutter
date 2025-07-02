import 'package:flutter/material.dart';
import 'detail.dart';

void main() {
  runApp(MaterialApp(title: 'ListView JSON App', home: SideDrawerApp()));
}

class SideDrawerApp extends StatefulWidget {
  const SideDrawerApp({super.key});

  @override
  State<SideDrawerApp> createState() => _SideDrawerAppState();
}

class _SideDrawerAppState extends State<SideDrawerApp> {
  String picture1 = "https://picsum.photos/250?image=9";
  String picture2 = "https://picsum.photos/250?image=10";
  String backupPic = "";

  String nama1 = "Agus Sutarom";
  String nama2 = "Hilmi Firdaus";
  String backupNama = "";

  String email1 = "taroom@gmail.com";
  String email2 = "hilmi@gmail.com";
  String backupEmail = "";

  void gantiUser() {
    setState(() {
      // ganti user
      backupPic = picture1;
      picture1 = picture2;
      picture2 = backupPic;

      backupNama = nama1;
      nama1 = nama2;
      nama2 = backupNama;

      backupEmail = email1;
      email1 = email2;
      email2 = backupEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sidebar Drawer"),
        backgroundColor: Colors.amber,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(nama1),
              accountEmail: Text(email1),
              // CircleAvatar dengan loadingBuilder + errorBuilder
              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Detail(
                            nama: nama1,
                            gambar: picture1,
                          )));
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: ClipOval(
                    child: Image.network(
                      picture1,
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.person, size: 40),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.amber,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://blog.sebastiano.dev/content/images/2019/07/1_l3wujEgEKOecwVzf_dqVrQ.jpeg"),
                      fit: BoxFit.cover)),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () => gantiUser(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: ClipOval(
                      child: Image.network(
                        picture2,
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.person, size: 12),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(
                              strokeWidth: 4,
                              color: Colors.amber,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text("Setting"),
              trailing: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Tutup"),
              trailing: Icon(Icons.close),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
      ),
    );
  }
}
