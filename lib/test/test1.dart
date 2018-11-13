import 'package:flutter/material.dart';
import 'package:flutter_app_jack/main.dart';

class Test1App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Test1App();
  }
}

class _Test1App extends State<Test1App> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration(seconds: 2), () {
//      Navigator.pushReplacement(context,
//          MaterialPageRoute(builder: (context) => SecondPage(data: "欢迎来到第二页")));

      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => SecondPage(data: "欢迎来到第二页")
          ), (route) => route == null);

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Image.asset(
        "image/lake.jpg",
        width: 600.0,
        height: 240.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
