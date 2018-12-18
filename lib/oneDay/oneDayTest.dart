import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_jack/oneDay/StarView.dart';

void main() => runApp(new MaterialApp(
  title: "五角星",
  home: new FiveStar(),
  //添加跳转
));

class FiveStar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FiveStarState();
  }
}

class _FiveStarState extends State<FiveStar> {

  Color _color = Colors.black;

  void _changeColor() {
    setState(() {
      _color = randomRGB();
    });
  }

  //-----------随机颜色-------------------
  Color randomRGB() {
    Random random = new Random();
    int r = 30 + random.nextInt(200);
    int g = 30 + random.nextInt(200);
    int b = 30 + random.nextInt(200);
    return Color.fromARGB(255, r, g, b);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("五角星"),),
      body: new CustomPaint(painter: new StarView(context ,_color),),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColor,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),);
  }
}