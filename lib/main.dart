import 'dart:ui';
import 'package:flutter/material.dart';

import 'first_page.dart';
import 'home_page.dart';

void main() => runApp(getRouter(window.defaultRouteName));

Widget getRouter(String name) {
  switch (name) {
    case "route1":
      return MyApp();
    case"animator":
      return FadeAppTest();
    default:
      return Center(
        child: Text(
          "unkonw route :$name",
          textDirection: TextDirection.ltr,
        ),
      );
  }
}


