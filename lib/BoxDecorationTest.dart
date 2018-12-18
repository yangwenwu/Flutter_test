import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(
      title: "hengheng",
      home: new ContainerTransform(),
//      home: new TestSafeArea(),
    ));

class ContainerTransform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContainerTransformState();
  }
}

class _ContainerTransformState extends State<ContainerTransform> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("contanner.transform"),
      ),
      body: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              _container(),
              _text(),
              _container2(),
              _container3(),
            ],
          ),
          _container4(),
          _container5(),
          _container6(),
          new Row(
            children: <Widget>[
//              _boxLayout(),_sizeBoxExpand(),
            ],
          ),
          _container7(),
//          _safeArea(),
        ],
      ),
    );
  }

  Widget _container() {
    return new Container(
      height: 100.0,
      width: 100.0,
//      transform: Matrix4.rotationZ( pi / 4),
      decoration: BoxDecoration(color: Colors.yellowAccent),
      child: Text(
        "Hi",
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _text() {
    return new Text("Hi Hi");
  }

  Widget _container2() {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: Colors.yellow,
//          border: Border.all(color: Colors.black, width: 3.0), ///间隙的宽度
//          borderRadius: BorderRadius.all(Radius.circular(18.0)), ///圆角
        ///
        border: Border(
            top: BorderSide(color: Colors.red, width: 5),
            right: BorderSide(color: Colors.red, width: 5)),

        ///间隙的宽度
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
      ),
    );
  }

  Widget _container3() {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _container4() {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(blurRadius: 20.0),
        ],
      ),
    );
  }

  Widget _container5() {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        ///渐变色  LinearGradient    RadialGradient光圈渐变    SweepGradient 环视
        gradient: RadialGradient(
          colors: const [
            Colors.red,
            Colors.blue,
            Colors.green,
            Colors.amber,
            Colors.grey,
          ],
//stops: [ 5.0,5.0,5.0,]
          stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
        ),
      ),
    );
  }

  Widget _container6() {
    return Container(
      height: 100.0,
      width: 100.0,

      ///将BoxDecoration设置为foregroundDecoration，它绘制在Container的子项之上（而装饰是在子项后面绘制的）。
      foregroundDecoration: BoxDecoration(
        backgroundBlendMode: BlendMode.exclusion,
        gradient: LinearGradient(
          colors: const [
            Colors.red,
            Colors.blue,
          ],
        ),
      ),
      child: Image.network(
        'https://flutter.io/images/catalog-widget-placeholder.png',
      ),
    );
  }

  Widget _container7() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://flutter.io/images/catalog-widget-placeholder.png',
          ),
        ),
      ),
      child: Container(
        height: 100.0,
        width: 100.0,
        foregroundDecoration: BoxDecoration(
          backgroundBlendMode: BlendMode.exclusion,
          gradient: LinearGradient(
            colors: const [
              Colors.red,
              Colors.blue,
            ],
          ),
        ),
      ),
    );
  }

  Widget _boxLayout() {
    return new SizedBox(
      height: 20,
      width: 100,
      child: new Text("5555555556666666666666666666666666665",maxLines: 1,),
    );
  }

  Widget _sizeBoxExpand(){
    return new SizedBox.expand(
      child: new Text("dddddddddddddd")
    );
  }



}

Widget _safeArea(){
  return SafeArea(
    child: SizedBox.expand(
      child: Card(color: Colors.yellowAccent),
    ),
  );
}

class TestSafeArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: Colors.blue,
      child: _safeArea(),
    );
  }
}
