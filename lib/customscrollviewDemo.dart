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
      home: new ListViewLayout(),
    ));

class ListViewLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _listViewLayoutState();
  }
}

class _listViewLayoutState extends State<ListViewLayout> {
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
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              },
            ),
          ),
        ],
      )


    );
  }
}
