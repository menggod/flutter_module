import 'package:flutter/material.dart';
import 'package:flutter_module/widget/parent_widget.dart';
import 'package:flutter_module/widget/tab_box.dart';

void main() => runApp(ParentWidget());

class ContainerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      child: Center(
        child: TapBoxA(),
      ),
      decoration: BoxDecoration(color: Colors.white),
    ));
  }
}
