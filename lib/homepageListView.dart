import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_jack/HttpController.dart';

class HomeListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Page();
  }
}

class Page extends State<HomeListPage> {
  String dataStr = "";
  var _items = [];

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    Map<String, String> map = new Map();
    map["v"] = "1.0";
    map["month"] = "7";
    map["day"] = "25";
    map["key"] = "bd6e35a2691ae5bb8425c8631e475c2a";
    //http://210.5.58.206/hknews-api/selectSubjectList?parentCode=video
//    HttpController.post("http://api.juheapi.com/japi/toh", (data) {

//    String imageUrl;
//    String parentCode;
//    String focusUrl;
//    String jsonUrl;
//    String des;
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
    }, params: map);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      body:
          new ListView.builder(itemCount: _items.length, itemBuilder: itemView),
    );
  }

  Widget itemView(BuildContext context, int index) {
    Model model = this._items[index];
    //设置分割线
//    if (index.isOdd) return new Divider(height: 2.0);
    return new Container(
        color: Color.fromARGB(0x22, 0x49, 0xa9, 0x8d),
        child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
//                    new Image.network(model.imageUrl,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,),
                    new Image.network(model.imageUrl,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
//                    new Text("${model.name}",
//                          style: new TextStyle(fontSize: 22.0,color: Colors.white ,fontFamily: "Bold")),
                    new Center(
                      child: new Text("${model.name}",
                          style: new TextStyle(fontSize: 25.0,color: Colors.white ,fontFamily: "Bold")),
                    )
                  ],
                )
            )
        )
    );
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('栏目列表'));
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
