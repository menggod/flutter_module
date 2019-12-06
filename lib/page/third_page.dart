import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "third page test",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ThirdHomePage("home page  text"),
    );
  }
}

class ThirdHomePage extends StatefulWidget {
  String title;

  ThirdHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          child: DefaultTextStyle(
            style: TextStyle(fontSize: 14, color: Colors.cyan),
            child: Column(
              children: <Widget>[Text("文本1"), Text("文本2"), Text("文本3")],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State createState() {
    return _ThirdPageState(title);
  }
}

class _ThirdPageState extends State<ThirdHomePage> {
  String text;

  _ThirdPageState(this.text);

  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        text = "改变了的text";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text(text ?? "状态  demo"),
    );
  }
}

class Live extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: new Text('哈哈'),
      ),
      body: Container(
        child:    ListView(
            children: <Widget>[
              //TODO:这里写子控件。
            ],
          ),
      ),
    );
  }
}
