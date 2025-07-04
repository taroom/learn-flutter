import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Grid App', home: GridApp()));
}

class GridApp extends StatefulWidget {
  const GridApp({super.key});

  @override
  State<GridApp> createState() => _GridAppState();
}

class _GridAppState extends State<GridApp> {
  List<Widget> daftarDigimon = [];

  var character = [
    {
      "name": "Agumon",
      "image":
          "https://static.wikia.nocookie.net/digimonadventure6597/images/6/64/Agumon01.png"
    },
    {
      "name": "Gabumon",
      "image":
          "https://static.wikia.nocookie.net/digimonadventure6597/images/d/d5/Gabumon02.png"
    },
    {
      "name": "Piyomon",
      "image":
          "https://static.wikia.nocookie.net/digimonadventure6597/images/9/90/Piyomon01.png"
    },
    {
      "name": "Tentomon",
      "image":
          "https://static.wikia.nocookie.net/digimonadventure6597/images/9/93/Tentomon01.png"
    },
    {
      "name": "Palmon",
      "image":
          "https://static.wikia.nocookie.net/digimonadventure6597/images/d/de/Palmon01.png"
    },
    {
      "name": "Gomamon",
      "image":
          "https://static.wikia.nocookie.net/digimonadventure6597/images/f/fd/Gomamon01.png"
    },
    {
      "name": "Patamon",
      "image":
          "https://static.wikia.nocookie.net/digimonadventure6597/images/8/8f/Patamon01.png"
    },
    {
      "name": "Tailmon",
      "image":
          "https://static.wikia.nocookie.net/digimonadventure6597/images/f/fc/Tailmon01.png"
    }
  ];

  buatlist() async {
    List<Widget> tempList = [];

    for (var i = 0; i < character.length; i++) {
      final char = character[i];
      final String? nameChar = char['name'];
      final String? imagechar = char['image'];
      tempList.add(Container(
          padding: EdgeInsets.all(2),
          child: Card(
            child: Column(
              children: <Widget>[
                Hero(
                    tag: nameChar!,
                    child: Material(
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DetailDigimon(
                                      nama: nameChar,
                                      gambar: imagechar,
                                    ))),
                        child: Image.network(imagechar!),
                      ),
                    )),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  nameChar,
                  style: TextStyle(fontSize: 15.0),
                )
              ],
            ),
          )));
    }
    setState(() {
      daftarDigimon = tempList;
    });
  }

  @override
  void initState() {
    super.initState();
    buatlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Digimon Adventure 1",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: daftarDigimon,
        ));
  }
}

class DetailDigimon extends StatelessWidget {
  final String nama;
  final String gambar;

  const DetailDigimon({super.key, required this.nama, required this.gambar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(0),
            height: 340,
            child: Hero(
                tag: nama,
                child: Material(
                  child: InkWell(
                    child: Image.network(
                      gambar,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ),
          ChapterName(
            name: nama,
          ),
          ChapterIcon(),
          ChapterDescription()
        ],
      ),
    );
  }
}

class ChapterName extends StatelessWidget {
  final String name;
  const ChapterName({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                Text(
                  '$name@gmail.com',
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 32,
                color: Colors.blue,
              ),
              Text("4.5")
            ],
          )
        ],
      ),
    );
  }
}

class ChapterIcon extends StatelessWidget {
  const ChapterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10)),
          ChapterIconWrap(icon: Icons.call, text: 'Panggil'),
          ChapterIconWrap(icon: Icons.message, text: 'Pesan'),
          ChapterIconWrap(icon: Icons.photo, text: 'Foto'),
        ],
      ),
    );
  }
}

class ChapterIconWrap extends StatelessWidget {
  final IconData icon;
  final String text;
  const ChapterIconWrap({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 50,
            color: Colors.blue,
          ),
          Text(text),
        ],
      ),
    );
  }
}

class ChapterDescription extends StatelessWidget {
  const ChapterDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
        ));
  }
}
