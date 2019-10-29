import 'package:flutter/material.dart';
import 'package:flutter_module/widget/tab_box.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
//        child: TabBoxB(_active, _handleTapBoxChanged),
            child: TapBoxA(),
      ),
    );
  }
}

class TabBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TabBoxB(this.active, this.onChanged);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: active ? Colors.lightBlue[700] : Colors.amberAccent),
        child: Center(
          child: Text(
            active ? "active" : "inactive",
            style: TextStyle(fontSize: 32.0, color: Colors.white,decoration: TextDecoration.none),
          ),
        )
      ),
    );
  }
}
