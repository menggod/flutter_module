import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatterPage extends StatefulWidget {
  @override
  _BatterPageState createState() => _BatterPageState();
}

class _BatterPageState extends State<BatterPage> {
  static const platform = const MethodChannel("samples.flutter.io/battery");
  String _batteryLevel = "unknown battery level";

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
      print(e);
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: _getBatteryLevel,
              child: Text("get battery level"),
            ),
            Text(_batteryLevel)
          ],
        ),
      ),
    );
  }
}
