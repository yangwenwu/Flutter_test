import 'package:flutter/material.dart';
import 'package:flutter_app_jack/GrideViewList.dart';
import 'package:flutter_app_jack/Route/RoutePage.dart';
import 'package:flutter_app_jack/bottomTabBar.dart';
import 'package:flutter_app_jack/listview/RefreshIndicator.dart';
import 'package:flutter_app_jack/test/test1.dart';
import 'package:flutter_app_jack/test/test2.dart';
import 'package:flutter_app_jack/GridView.dart';
import 'package:flutter_app_jack/listview1.dart';
import 'package:flutter_app_jack/homepageListView.dart';
import 'package:flutter_app_jack/GrideViewPullUpDown.dart';
import 'package:flutter_app_jack/TabBarViewPage.dart';

void main() => runApp(
//    MyApp()
//      JackApp()
//      MyAppJack()
//const Center(child: Text('Hello, world!', textDirection: TextDirection.ltr))

//new MaterialApp(
//  title: "hengheng",
//  home: new StartApp(
//    data: "你好",
//  ),
//)

//        new MaterialApp(
//      title: "hengheng",
//      home: new TestApp(),
// )
//    MyApp2()

        new MaterialApp(
      title: "hengheng",
      home: new ListViewLayout(),
      //添加跳转
      routes: {
//        "/": (context) => MyApp2(),
//        "/": (context) => Test1App(),
//        "/": (context) => ListViewApp(),
//        "/": (context) => ListView1(),
//        "/": (context) => HomeListPage(),
//        "/": (context) => GridViewPage(),
//        "/": (context) => GrideViewPullUpDown(),
//        "/": (context) => NewsListPagedemo(),
        "nameroute": (BuildContext context) => new SecondPage(),
        "test2Page": (BuildContext context) => new Test2(),
        "ListViewApp": (BuildContext context) => new ListViewApp(),

        // 这里可以定义静态路由，不能传递参数
        '/listview': (_) => new GridViewPage(),
        '/grideview': (_) => new GrideViewPullUpDown(),
        '/Route': (_) => new RoutePage(),
        '/tabBar': (_) => new TabBarViewPage(),
        '/tabTextBar': (_) => new TabBarViewPage(),
        '/bottomTabBar': (_) => new BottomTabBar(),
      },
    )

);


class  ListViewLayout extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _listViewLayoutState();
  }
}

class _listViewLayoutState extends State{

  List<String> list = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add("ListView");
    list.add("GrideView上拉加载更多下拉刷新");
    list.add("路由跳转");
    list.add("显示SnackBar");
    list.add("顶部tab控件");
    list.add("底部tab控件");

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("列表条目"),),
//      body: new ListView(
//        children: <Widget>[
//          new Text("ListView"),
//          new Text("ListView上拉加载更多下拉刷新"),
//          new Text("Rounte 路由跳转"),
//        ],),

        body: new ListView.builder(itemCount: list.length,itemBuilder:(context,index){
          return _listviewItem(context,index);
        },),
    );

  }

  _listviewItem (BuildContext context ,int index ){
    return GestureDetector(
      onTap: (){
        if(index == 0){
          Navigator.of(context).pushNamed("/listview");
        }else if(index == 1){
          Navigator.of(context).pushNamed("/grideview");
        }else if(index == 2){
          Navigator.of(context).pushNamed("/Route");
        }else if(index == 3){
          final snackBar = new SnackBar(duration: Duration(seconds: 2),content: new Text('这是一个SnackBar'));
          Scaffold.of(context).showSnackBar(snackBar);
        }else if(index == 4){
          Navigator.of(context).pushNamed("/tabBar");
        }else if(index == 5){
          Navigator.of(context).pushNamed("/bottomTabBar");
        }
      },
      child: new Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          new Container(
            child: new Text(list[index],),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(10),
            height: 30,
          ),
       
        new Divider(height: 0.8,)
      ],)

     
    );
  }

}





//column 垂直布局
//row 是水平布局

//container

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //这是水平布局
    Widget oritentionLayout = Container(
      child: Row(
        children: <Widget>[
          new Container(
              padding: const EdgeInsets.only(right: 20.0),
              child: new Text(
                "第一个 text",
              )),
          new Text(
            "第二个 text",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          new Text(
            "这是第3个Text",
            style: TextStyle(color: Colors.blue[500]),
          ),
          new Container(
            padding: EdgeInsets.only(left: 10, top: 30),
            child: new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondPage(data: "欢迎来到第二页");
                }));
//                Navigator.pushNamed<String>(context, "nameroute");
              },
            ),
          )
        ],
      ),
    );

    //中间上下的这个布局  横向布局
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
//            flex: 2,  这个是权重比
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
//                  alignment: Alignment(2.0, 3.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body: ListView(
//          scrollDirection: Axis.horizontal,
          children: [
            Image.asset(
              'static/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            oritentionLayout,
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({key, this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Column buildJackButtonText(IconData icon ,String label){
      Color color =Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.all(8.0),
            child: new Icon(icon,textDirection: TextDirection.ltr,),
//            child: Image.asset(
//              "/static/lake.jpg",
//              width:100 ,height: 100,
//              fit: BoxFit.contain,
//            ),
          )
          ,
          new Text(label,style: TextStyle(color: color,fontSize: 20,fontWeight: FontWeight.bold),)
        ],
      );
    }
    return new Scaffold(
      appBar: new AppBar(
        title: Text(data),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Text(
              "今天周三",
              style: TextStyle(
                  color: Colors.amber[500], fontWeight: FontWeight.bold),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context){
//                    return MyApp2();
                    return Test2();
                  }));
                },
                child: new Image.asset(
                  "static/lake.jpg",
                  height: 240,
                  width: 600,
                  alignment: Alignment.topCenter,
                )),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildJackButtonText(Icons.add, "添加"),
                buildJackButtonText(Icons.mail, "邮件"),
                buildJackButtonText(Icons.star, "星星"),
              ],
            )
            ,new RaisedButton(onPressed: (){
              Navigator.of(context).pop("回传回来的数据");
            },child: new Text("回传数据给上一个页面"),)
          ],
        ),
      ),
    );
  }
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container();
    padding:
    const EdgeInsets.all(32.0);
    child:
    new Row(
      children: <Widget>[
        new Expanded(
            child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new Text("Oeschinen Lake Campground",
                  style: new TextStyle(fontWeight: FontWeight.bold)),
            ),
            new Text(
              "Kandersteg, Switzerland",
              style: new TextStyle(color: Colors.grey[500]),
            ),
          ],
        )),
        new Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        new Text("41")
      ],
    );
  }
}

//StatelessWidget 是无状态的
class StartApp extends StatelessWidget {
  const StartApp({key, this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: new Center(
        child: Text(data, textDirection: TextDirection.ltr),
      ),
    );
  }
}

//statefullwidget是有状态的
class TestApp extends StatefulWidget {
  const TestApp({
    Key key,
    this.increase: 2,
  }) : super(key: key);
  final int increase;

  @override
  _TestApp createState() => _TestApp();
}

//通过调用setState(()来通知界面更新
class _TestApp extends State<TestApp> {
  int count = 0;

  void increment() {
    setState(() {
      count += widget.increase;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
//      body: new Center(child: Text("按钮点击 $count次",),),
      body: Column(
        verticalDirection: VerticalDirection.down,
//        crossAxisAlignment:CrossAxisAlignment.center,

        children: <Widget>[
          Text(
            "第一个text控件",
            style: new TextStyle(
                color: Colors.blue,
                fontSize: 16,
                wordSpacing: 3.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "按钮点击 $count次数",
            style: TextStyle(
                color: Colors.yellow, fontSize: 25, letterSpacing: 5.0),
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
          ),
          Icon(Icons.ac_unit)
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: increment,
        tooltip: "增加",
        child: new Icon(Icons.add),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo '),
    );
  }
}

class JackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter  结构简析",
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: JackHomePage(),
    );
  }
}

class JackHomePage extends StatefulWidget {
  @override
  JackHomePageState createState() => JackHomePageState();
}

class JackHomePageState extends State<JackHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('我是第一个item')),
          ListTile(title: Text('我是第二个item')),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyAppJack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    //...
  }
}
