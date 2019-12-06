import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_module/utils/event_agent.dart';

class StlessLifecyclePage extends StatelessWidget {
  StlessLifecyclePage() {
    debugPrint("StlessLifecyclePage--->构造");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text("无状态"))),
    );
  }
}

class StfullLifecyclePage extends StatefulWidget {
  StfullLifecyclePage() {
    debugPrint("StfullLifecyclePage--->构造");
    EventAgent.instance.sendEvent();
  }

  @override
  _StfullLifecyclePageState createState() => _StfullLifecyclePageState();
}

class _StfullLifecyclePageState extends State<StfullLifecyclePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    debugPrint("initState--->");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint("didChangeAppLifecycleState--->$state");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies--->");
  }

  @override
  void didUpdateWidget(StfullLifecyclePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("didUpdateWidget--->");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("dispose--->");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
