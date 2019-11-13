import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_module/net_test_page.dart';
import 'package:flutter_module/second_page.dart';

import 'first_page.dart';
import 'home_page.dart';
import 'third_page.dart';

void main() => runApp(getRouter(window.defaultRouteName));

Widget getRouter(String name) {
  switch (name) {
    case "route1":
      return MyApp();
    case "animator":
      return FadeAppTest();
    case "first_page":
      return FadeAppTest();
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
        "net_test_page": (context) => NetTestPage()
      },
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => UnknownPage()),
      theme: ThemeData(
          brightness: Brightness.light,
          accentColor: Colors.black,
          primaryColor: Colors.cyan,
          iconTheme: IconThemeData(color: Colors.yellow),
          textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            ItemTitle(
              "first_page",
              color: Colors.blue,
            ),
            ItemTitle("second_page",subTitle: "fade 动画"),
            ItemTitle("third_page", color: Colors.cyan),
            ItemTitle("net_test_page",
                color: Colors.amberAccent, subTitle: "网络测试")
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
    Navigator.pushNamed(context, _title);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _processJump(context),
      child: Container(
        color: _color ?? Colors.pinkAccent,
        child: ListTile(
            leading: Icon(_iconData ?? Icons.settings),
            title: Text(_title),
            trailing: Text(_subTitle ?? ""),
      ),
    ),);
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
