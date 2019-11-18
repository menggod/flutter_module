import 'package:flutter/material.dart';

class NativeCommunicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter native communication page",
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: NativeHomePage(),
    );
  }
}

// ignore: must_be_immutable
class NativeHomePage extends StatefulWidget {
  String title = "";

  @override
  _NativeHomePageState createState() => _NativeHomePageState();
}

class _NativeHomePageState extends State<NativeHomePage> {
  String _message = "no message yet ...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
