import 'package:flutter/material.dart';

void main() => runApp(new FirstPage());

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.cyan[100],
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "net_test_page");
                },
                child: Text("网络测试页面"),
              ),
              RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "fourth_page");
                  },
                  child: Text("fourth_page"))
            ],
          ),
        ),
      ),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  final String title;

  MyFadeTest(this.title);

  @override
  _MyFadeTestState createState() => _MyFadeTestState();
}

class _MyFadeTestState extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Container(
          child: FadeTransition(
            opacity: curvedAnimation,
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}
