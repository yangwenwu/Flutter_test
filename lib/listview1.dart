import 'package:flutter/material.dart';
import 'package:flutter_app_jack/main.dart';
import 'package:flutter_app_jack/listview1.dart';
import 'package:flutter_app_jack/GridView.dart';
import 'package:http/http.dart';


class ListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("listview"),),
      body: new Home(),
    );
  }

}


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _home();
  }

}

class _home extends State {

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemCount: 40, itemBuilder: buildItem);
  }

  Widget buildItem(BuildContext context, int index) {

    if (index.isOdd) {
      return new Divider();
    }
    TextStyle textStyle = new TextStyle(color: Colors.blue, fontSize: 25,);

//    return new Padding(
//        padding: const EdgeInsets.all(10)
//    , child: new Text("这是第$index", style: textStyle,),);

  return new GestureDetector(
    onTap: (){
      print("点击了$index个");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
//        return  SecondPage(data: "欢迎来到第二页");
        return  ListViewApp();
      }));
    },
//    new Padding(
//        padding: const EdgeInsets.all(10)
//    , child: new Text("这是第$index", style: textStyle,),)

  child: new Padding(
  padding: const EdgeInsets.all(10)
    , child: new Text("这是第$index", style: textStyle,),),
  );

  }
}




