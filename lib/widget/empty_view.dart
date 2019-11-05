import 'package:flutter/material.dart';


class EmptyView extends StatelessWidget {

  final String name;

  EmptyView(this.name);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "mf flutter module ->unkonw route :$name",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            color: Colors.red
        ),
      ),
    );
  }
}