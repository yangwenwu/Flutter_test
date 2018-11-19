import 'package:flutter/material.dart';

class Layout extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _Layout();
  }
}

class _Layout extends State<Layout>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ddddd"),
      ),
      body: new FittedBox(
        fit: BoxFit.contain,
        alignment: Alignment.bottomCenter,
        child: new Text("TTTTT"),
      ),
    );
  }

}
