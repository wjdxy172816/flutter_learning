import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

var images = [
  'assets/images/2x/shili.png',
  'assets/images/2x/shili.png',
  'assets/images/2x/shili.png',
  'assets/images/2x/shili.png',
  'assets/images/2x/shili.png',
  'assets/images/2x/shili.png',
  'assets/images/2x/shili.png',
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListWheelScrollView(
            perspective: 0.01,
              diameterRatio: 1.0,
              itemExtent: MediaQuery.of(context).size.height,
              children: images.map((path)=>Card(
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset(
                      path,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      child: Text(
                        "图片内容",
                        style:
                        TextStyle(fontSize: 20, color: Color(0xff00ff00)),
                      ),
                    ),
                  ],
                ),
              )).toList())),
    );
  }
}
