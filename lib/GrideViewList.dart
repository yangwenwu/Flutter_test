import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_app_jack/HttpController.dart';

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GridView"),
      ),
      body: new GridViewList(),
    );
  }
}

class GridViewList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridViewList();
  }
}

class _GridViewList extends State<GridViewList> {
  String dataStr = "";
  var _items = [];

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: false,
//      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisCount: 2,
//      crossAxisSpacing: 4.0,
      childAspectRatio: 1.27, //调整这个系数可以通过比例来调整GridView 的宽高比例
      children: buildWidget(_items.length),
    );
  }

  List<Widget> buildWidget(int number) {
    List<Widget> widgetList = new List();
    for (int i = 0; i < number; i++) {
      widgetList.add(getItemWidget(context, i));
    }
    return widgetList;
  }

  Widget getItemWidget(BuildContext context, int index) {
    Model model = _items[index];
    //BoxFit 可设置展示图片时 的填充方式
    return new GestureDetector(
      onTap: () {
        showCustomDialog(context);
      },
        child: Stack(
          alignment: Alignment.center,

          children: <Widget>[
            Image.network(
              model.imageUrl,
              fit: BoxFit.cover,
            ),
            Text(
              model.name,
              style: new TextStyle(
                  fontFamily: "Bold", color: Colors.white, fontSize: 18.0),
            ),
          ],
      ),
    );
  }

  void getData() {
    HttpController.get(
        "http://210.5.58.206/hknews-api/selectSubjectList?parentCode=video",
        (data) {
      if (data != null) {
//        final body = JSON.decode(data.toString());
        final body = jsonDecode(data.toString());
        final feeds = body["resObject"];
        var items = [];
        feeds.forEach((item) {
          items.add(Model(
              item["id"],
              item["name"],
              item["imageUrl"],
              item["imageUrl"],
              item["parentCode"],
              item["focusUrl"],
              item["jsonUrl"]));
        });
        setState(() {
          dataStr = data.toString();
          _items = items;
        });
      }
    }, params: null);
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text("点击提示"),
            content: new SingleChildScrollView(
                child: new ListBody(children: <Widget>[new Text("你点击了Item")])),
            actions: <Widget>[
              new FlatButton(
                child: new Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text("确认"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
}

class Model {
  String id;
  String name;
  String imageUrl;
  String parentCode;
  String focusUrl;
  String jsonUrl;
  String des;

  Model(this.id, this.name, this.imageUrl, this.parentCode, this.focusUrl,
      this.jsonUrl, this.des);
}
