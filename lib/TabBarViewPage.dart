import 'package:flutter/material.dart';

class TabBarViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TabBarViewPage();
  }
}

class _TabBarViewPage extends State<TabBarViewPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget firstPage(){
      return  new Column(
        children: <Widget>[
          new Text("第一个栏目"),
          new RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return new TextTabBar();
            }));
          }
          ,child: new Text("全是文本的TabBar"),)
        ],
      );

    }



    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: Text("TabBar"),
        bottom: new TabBar(
          indicatorWeight: 4.0,
            labelPadding: EdgeInsets.all(10),
            indicatorPadding:EdgeInsetsDirectional.only(start: 10,end: 3.0,bottom: 3.0),
            controller: tabController, tabs: <Widget>[
          new Tab(
//              icon: new Icon(Icons.ac_unit),
            icon: new Image.asset(
              "image/top.png",
              height: 50,
              width: 50,
            ),
          ),
          new Tab(
            icon: new Icon(Icons.add_a_photo),
          ),
          new Tab(
            icon: new Icon(Icons.access_alarm),
          )
        ]),
      ),
      body: new TabBarView(controller: tabController, children: <Widget>[
//        new Center(child: new Text("雪花")),
        firstPage(),
        new Center(child: new Text('相机')),
        new Center(child: new Text('闹钟')),
      ]),
    );

  }

}


class TextTabBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextTabBar();
  }
}

class _TextTabBar extends State with SingleTickerProviderStateMixin{
  TabController tabController2;

  @override
  void initState() {
    tabController2 = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: Text("TabBar"),
        bottom: new TabBar(
            indicatorWeight: 4.0,
            labelPadding: EdgeInsets.all(10),
            indicatorPadding:EdgeInsetsDirectional.only(start: 10,end: 3.0,bottom: 3.0),
            controller: tabController2, tabs: <Widget>[
          new Tab(
            text: "第一页",
          ),
          new Tab(
            text: "第二页",
          ),
          new Tab(
            text: "第三页",
          )
        ]),
      ),
      body: new TabBarView(controller: tabController2, children: <Widget>[
        new Center(child: new Text("雪花")),
        new Center(child: new Text('相机')),
        new Center(child: new Text('闹钟')),
      ]),
    );
  }

}
