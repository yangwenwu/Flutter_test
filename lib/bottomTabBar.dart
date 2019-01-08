import 'package:flutter/material.dart';
import 'package:flutter_app_jack/iconfont.dart';

class BottomTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomTabBar();
  }
}

class _BottomTabBar extends State<BottomTabBar> {
  Widget _page1() {
    return new Column(
      children: <Widget>[
        new Image.asset("image/lake.jpg"),
        new FloatingActionButton(
          onPressed: null,
          child: new Text("浮动按钮"),
        )
      ],
    );
  }

  int _selectedIndex = 2;
  final _widgetOptions = [
    Text('Index 0: Home'),
//    _page1(),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];

  List<BottomNavigationBarItem> bars = [];

  BottomNavigationBarItem setBar1() {
    return new BottomNavigationBarItem(
        title: new Text("深圳"), icon: new Icon(TolyIcon.huiyuan));
  }

  BottomNavigationBarItem setBar2() {
    return new BottomNavigationBarItem(
        title: new Text("珠海"), icon: new Icon(Icons.add_a_photo));
  }

  BottomNavigationBarItem setBar3() {
    return new BottomNavigationBarItem(
        title: new Text("澳门"), icon: new Icon(Icons.label));
  }

  @override
  void initState() {
    // TODO: implement initState
    bars.add(setBar1());
    bars.add(setBar2());
    bars.add(setBar3());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
//          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
//          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.deepPurple,
//        onTap: _onItemTapped,
//      ),

      bottomNavigationBar: BottomNavigationBar(
          items: bars,
          currentIndex: _selectedIndex,
          fixedColor: Colors.deepOrangeAccent,
          type: BottomNavigationBarType.fixed,
//第一种写法
//          onTap: _onItemTapped
//      第二种写法
      onTap: (int index){
            _onItemTapped(index);
      },
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
