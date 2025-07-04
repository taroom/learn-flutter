import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(MaterialApp(title: 'Gradient App', home: GradientApp()));
}

class GradientApp extends StatefulWidget {
  const GradientApp({super.key});

  @override
  State<GradientApp> createState() => _GradientAppState();
}

class _GradientAppState extends State<GradientApp> {
  final List<String> imageDigimon = [
    "https://static.wikia.nocookie.net/digimonadventure6597/images/6/64/Agumon01.png",
    "https://static.wikia.nocookie.net/digimonadventure6597/images/d/d5/Gabumon02.png",
    "https://static.wikia.nocookie.net/digimonadventure6597/images/9/90/Piyomon01.png",
    "https://static.wikia.nocookie.net/digimonadventure6597/images/9/93/Tentomon01.png",
    "https://static.wikia.nocookie.net/digimonadventure6597/images/d/de/Palmon01.png",
    "https://static.wikia.nocookie.net/digimonadventure6597/images/f/fd/Gomamon01.png",
    "https://static.wikia.nocookie.net/digimonadventure6597/images/8/8f/Patamon01.png",
    "https://static.wikia.nocookie.net/digimonadventure6597/images/f/fc/Tailmon01.png",
    "https://static.wikia.nocookie.net/digimon/images/b/b2/Digimon_Adventure.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.black,
              Colors.red,
              Colors.blue,
            ])),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.7),
          itemCount: imageDigimon.length,
          itemBuilder: (BuildContext context, int i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 22),
              child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 8.0,
                  child: Stack(fit: StackFit.expand, children: <Widget>[
                    Hero(
                      tag: imageDigimon[i],
                      child: Material(
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HalamanDetailImage(
                                          image: imageDigimon[i]))),
                          child: Image.network(
                            imageDigimon[i],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ])),
            );
          },
        ),
      ),
    );
  }
}

class HalamanDetailImage extends StatefulWidget {
  final String image;
  const HalamanDetailImage({super.key, required this.image});

  @override
  State<HalamanDetailImage> createState() => _HalamanDetailImageState();
}

class _HalamanDetailImageState extends State<HalamanDetailImage> {
  Color warna = Colors.grey;
  void optionSelected(Options pilihan) {
    setState(() {
      warna = pilihan.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digimon Monster"),
        actions: <Widget>[
          PopupMenuButton<Options>(
            onSelected: (Options selectedOption) {
              optionSelected(selectedOption);
            },
            itemBuilder: (BuildContext context) {
              return listOptions.map((Options option) {
                return PopupMenuItem<Options>(
                  value: option,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.star, color: option.color),
                      const SizedBox(width: 10),
                      Text(option.text),
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(center: Alignment.center, colors: [
              Colors.blue,
              warna,
              Colors.black.withOpacity(0.9)
            ])),
          ),
          Center(
            child: Hero(
              tag: widget.image,
              child: ClipOval(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ Class Options diperbaiki
class Options {
  final String text;
  final Color color;
  const Options(this.text, this.color);
}

// ✅ Contoh isi list dengan data variatif
List<Options> listOptions = const <Options>[
  Options("Kekuatan", Colors.red),
  Options("Pertahanan", Colors.blue),
  Options("Kecerdasan", Colors.green),
];
