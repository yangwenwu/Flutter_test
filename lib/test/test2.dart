import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Test2State();
  }
}

class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      title: new Text("dddd"),
      ) ,
      body: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text("flutter"),
//          new FlatButton.icon(onPressed: (){
//            print("点击了加号");
//          }, icon: new Icon(Icons.add), label: null),
          new FlatButton(
              onPressed: () {
                print("点击了加号");
              },
              child: new Icon(Icons.add))
        ],
      ),
    );
  }
}
