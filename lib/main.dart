import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/rendering.dart';
import 'package:flutter_module/page/net_test_page.dart';
import 'package:flutter_module/page/second_page.dart';



import 'page/battery_page.dart';
import 'page/first_page.dart';
import 'page/fourth_page.dart';
import 'page/third_page.dart';

void main() {
  debugPaintSizeEnabled = false;
  debugPaintBaselinesEnabled = false;
  debugPaintLayerBordersEnabled = true;
  runApp(getRouter(window.defaultRouteName));
}

Widget getRouter(String name) {
  switch (name) {
    case "first_page":
      return FadeAppTest();
    case "second_page":
      return FadeAppTest2();
    case "third_page":
      return ThirdPage();
    case "net_test_page":
      return NetTestPage();
    case "battery_page":
      return BatteryPage();
    default:
      return MyAppList();
  }
}

class MyAppList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "first_page": (context) => FadeAppTest(),
        "second_page": (context) => FadeAppTest2(),
        "third_page": (context) => ThirdPage(),
        "net_test_page": (context) => NetTestPage(),
        "fourth_page": (context) => TestPage(),
        "battery_page": (context) => BatteryPage()
      },
      onUnknownRoute: (RouteSettings setting) => MaterialPageRoute(builder: (context) => UnknownPage()),
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.black,
        primaryColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.yellow),
      ),
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            ItemTitle("first_page", color: Colors.blue),
            ItemTitle("second_page", subTitle: "fade 动画"),
            ItemTitle("third_page", color: Colors.cyan),
            ItemTitle("net_test_page", color: Colors.amberAccent, subTitle: "网络测试"),
            ItemTitle("fourth_page", color: Colors.deepOrange),
            ItemTitle(
              "battery_page",
              color: Colors.lightBlue,
              subTitle: "调用原生测试",
            ),
            ItemTitle(
              "toast",
              color: Colors.lightGreenAccent,
              subTitle: "吐司测试",
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemTitle extends StatelessWidget {
  String _title;
  String _subTitle;
  IconData _iconData;
  Color _color;

  ItemTitle(this._title, {iconData, color, subTitle}) {
    _iconData = iconData;
    _color = color;
    _subTitle = subTitle;
  }

  void _processJump(BuildContext context) {
    if (_title == "toast") {
    
    } else {
      Navigator.pushNamed(context, _title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("点击了--->$_title"),
        ));
        _processJump(context);
      },
      child: Container(
        color: _color ?? Colors.pinkAccent,
        child: ListTile(
          leading: Icon(_iconData ?? Icons.settings),
          title: Text(_title),
          trailing: Text(
            _subTitle ?? "",
            style: prefix0.TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('unkonwn page'),
      ),
      body: Center(
        child: Text("unknown page"),
      ),
    );
  }
}
