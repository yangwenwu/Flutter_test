import 'package:flutter/material.dart';
import 'package:flutter_app_jack/GrideViewList.dart';
import 'package:flutter_app_jack/Route/RoutePage.dart';
import 'package:flutter_app_jack/bottomTabBar.dart';
import 'package:flutter_app_jack/globalkey.dart';
import 'package:flutter_app_jack/layout.dart';
import 'package:flutter_app_jack/listview/RefreshIndicator.dart';
import 'package:flutter_app_jack/radio.dart';
import 'package:flutter_app_jack/test/test1.dart';
import 'package:flutter_app_jack/test/test2.dart';
import 'package:flutter_app_jack/GridView.dart';
import 'package:flutter_app_jack/homepageListView.dart';
import 'package:flutter_app_jack/GrideViewPullUpDown.dart';
import 'package:flutter_app_jack/TabBarViewPage.dart';
import 'package:flutter_app_jack/httpDio.dart';

void main() => runApp(new MaterialApp(
      title: "hengheng",
      home: new RoundImageLayout(),
    ));

class RoundImageLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RoundImageLayoutState();
  }
}

class _RoundImageLayoutState extends State<RoundImageLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("测试图片"),
      ),
      body: new Column(
        children: <Widget>[
//          new Image.asset(
//            "image/lake.jpg",
//            width: 20,
//            height: 20,
//          ),
          ///CircleAvatar  圆形图像
          new Container(
//      new CircleAvatar(
//          backgroundImage: new AssetImage('images/p_box1.png'),
//      backgroundColor: Colors.transparent,
//      radius: 10.0,),),

            width: 100,
            height: 100,
            child: CircleAvatar(
//              backgroundColor: Colors.red,
//              foregroundColor: Colors.green,
              radius: 10.0,
//            minRadius: 2,
//            maxRadius: 2,
              backgroundImage: AssetImage("image/lake.jpg"),
//              child: new Image.asset(
//                "image/lake.jpg",
//                width: 95,
//                height: 95,
//                fit: BoxFit.cover,
//              ),
            ),
          ),
          ///ClipOval  第三个
          new Container(
            child: new ClipOval(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: new Image.asset(
                "image/lake.jpg",
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
          ),
      new Container(
        width: 100.0,
        height: 100.0,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(90),
//          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
                "image/ali_connors.png",
            ),
          ),
        ),
      ),
          new Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: new ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(6),topRight: Radius.circular(6),bottomLeft: Radius.zero,bottomRight:Radius.zero),
              child: new Image.asset( "image/lake.jpg",),
            ),
          ),
      new Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
//          backgroundBlendMode: BlendMode.colorBurn,
          shape: BoxShape.rectangle,
          color: Colors.green,
//          border: Border(top: BorderSide(width: 2,color: Colors.red)),
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            fit: BoxFit.fill,  //这个地方很重要，需要设置才能充满
            image: AssetImage("image/lake.jpg",
            ),
          ),
        ),
      ),
        ],
      ),
    );
  }
}
