import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter_app_jack/model/categorybean.dart';

class DioTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DioTest();
  }
}

class _DioTest extends State<DioTest> {
  List<ResObject> resList = [];
  var dataStr = "";

  Future getData() async {
    Dio dio = new Dio();
    //https://gank.io/api/data/all/30/1      gank 接口
    Response response = await dio
        .get(
            "http://210.5.58.206/hknews-api/selectSubjectList?parentCode=video",
            cancelToken: CancelToken())
        .catchError((DioError onError) {
      if (!CancelToken.isCancel(onError)) {
        print(onError.message);
      }
    });
    print(response.data);
    if (response.data != null) {
//      第一种写法
//      var jsonStr = await response.data;
//      var category = new CategoryBean.fromJson(jsonStr);

//      第二种写法
      Map map = response.data;
      CategoryBean categoryBean = new CategoryBean.fromJson(map);
      resList = categoryBean.resObject;
      setState(() {
        dataStr = response.data.toString();

      });
    } else {
//      dataStr = "没有数据";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("Dio网络请求"),
//        ),
//        body: new SingleChildScrollView(
//          child: ConstrainedBox(
//            constraints: BoxConstraints(
////      minHeight: .maxHeight,
//                ),
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                Container(
//                  // A fixed-height child.
//                  color: Colors.yellow,
//                  height: 120.0,
//                ),
//                Container(
//                  // Another fixed-height child.
//                  color: Colors.green,
//                  height: 120.0,
//                ),
//                new ListTile(title: new Text("$dataStr"),)
//              ],
//            ),
//          ),
//        )
//        );
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _itemBuilder(BuildContext context, int index) {
      return new Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        child: new Column(
//          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(resList[index].name),
            new Text(resList[index].parentCode),
            new Text(resList[index].imageUrl),
            new Divider(
              height: 0.8,
            )
          ],
        ),
      );
      
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("网络请求"),
        elevation: 0.0,
      ),
      body: new ListView.builder(
        itemBuilder: _itemBuilder,
        itemCount:resList.length,
      ),
    );
  }
}
