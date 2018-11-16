import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_jack/model/categorybean.dart';

class GlobalJackKey extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GlobalJackKey();
  }
}

class _GlobalJackKey extends State<GlobalJackKey> {
  GlobalKey<RefreshIndicatorState> _globalKey = new GlobalKey();
  List<ResObject> resList = <ResObject>[];
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(_scrollListener);
    getData();
    super.initState();
  }

  Future refresh() async {
    getData();
  }

  _scrollListener() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (resList.length > 0) {
        resList.clear();
      }
//      getData();
      setState(() {});
    }
  }

  Widget _buildContent() {
    if (resList.isEmpty) {
      return new Center(
        child: new Text("没有数据"),
      );
    } else {
      return new ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (_, index) => _itemBuilder(context, index),
        itemCount: resList.length,
        controller: _scrollController,
      );
    }
  }

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

  //知识点    _scrollController.position.maxScrollExtent   滑动到底部
//scrollDistance = _scrollController.position.pixels; 滑动的距离

  getData() async {
    Dio dio = new Dio(); ////https://gank.io/api/data/all/30/1      gank 接口
    Response response = await dio
        .get(
            "http://210.5.58.206/hknews-api/selectSubjectList?parentCode=video",
            cancelToken: CancelToken())
        .catchError((DioError onError) {
      if (!CancelToken.isCancel(onError)) {
        print(onError.message);
      }
    });
    if (response.data != null) {
//      第一种写法
//      var jsonStr = await response.data;
//      var category = new CategoryBean.fromJson(jsonStr);
//      第二种写法
      Map map = response.data;
      CategoryBean categoryBean = new CategoryBean.fromJson(map);
      resList = categoryBean.resObject;
      setState(() {});
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("GloabalKey使用-刷新"),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            _globalKey.currentState.show();
          },
//          tooltip: new Tooltip(message: null)
          tooltip: 'refresh',
//          child: new Icon(Icons.refresh),
          child: new Icon(Icons.refresh),
        ),
        body:
//        _buildContent()
            new RefreshIndicator(
          onRefresh: refresh,
          key: _globalKey,
          child:
//          new ListView.builder(
//            physics: AlwaysScrollableScrollPhysics(),
//            itemBuilder: (_, index) => _itemBuilder(context, index),
//            itemCount: resList.length,
//            controller: _scrollController,
//          )
              _buildContent(),
        ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
