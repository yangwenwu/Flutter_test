import 'package:flutter/material.dart';
import 'package:flutter_app_jack/GridView.dart';
import 'package:flutter_app_jack/main.dart';


class RoutePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _RoutePage();
  }

}

class _RoutePage extends State<RoutePage>{

  String str = "该text用于接收显示回传的数据";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      appBar: new AppBar(title: new Text("路由导航"),elevation: 0,),
      body: new Column(
        children: <Widget>[
          new RaisedButton(onPressed: (){
            Navigator
                .of(context)
                .push(new MaterialPageRoute(builder: (_) {
              return new SecondPage(data: '路由是个好东西，要进一步封装');
            })).then((value){
              str = value;
//              setState(() {
//
//              });
            });
          },child: new Text("传递参数跳转并且回传数据"),
          ),
          new FloatingActionButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return new SecondPage(data: "参数是路由跳转过来的传参",);
            }));

//            Navigator.push(context, MaterialPageRoute(builder: (context) {
//              return SecondPage(data: "欢迎来到第二页");
//            }));
          },child: new Text("传递参数跳转",textAlign: TextAlign.center,),)
        ,new RaisedButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return ListViewApp();
          }));
          },child: new Text("跳转后关闭界面"),)
        ,new Text(str)],

      ) ,
    );

  }

}