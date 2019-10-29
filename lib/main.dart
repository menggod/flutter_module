import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

import 'first_page.dart';
import 'home_page.dart';

void main() => runApp(getRouter(window.defaultRouteName));

Widget getRouter(String name) {
  switch (name) {
    case "route1":
      return MyApp();
    case"animator":
      return FadeAppTest();
    case "first_page":
      return FadeAppTest();
    default:
      return Center(
        child: Text(
          "mf flutter module ->unkonw route :$name",
          textDirection: TextDirection.ltr,
          style: prefix0.TextStyle(
            color: Colors.red
          ),
        ),
      );
  }
}


