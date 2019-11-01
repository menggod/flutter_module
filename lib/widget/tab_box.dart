import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class TapBoxA extends StatefulWidget {
  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  void _handleDoubleClick() {
    Toast.show("double", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
    _handleTap();

  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onDoubleTap: _handleDoubleClick,
      child: Container(
        child: Center(
          child: Text(_active ? "active" : "inactive",
              style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                  decoration: TextDecoration.none)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: _active ? Colors.lightBlue[700] : Colors.pinkAccent),
      ),
    );
  }
}


