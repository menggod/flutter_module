import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/route/route_handles.dart';
import 'package:flutter_module/widget/empty_view.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String login = "/login";
  static String dailySongs = "/daily_songs";
  static String playList = "/play_list";
  static String topList = "/top_list";
  static String playSongs = "/play_songs";
  static String comment = "/comment";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return (EmptyView("NOT FOUND"));
    });
    router.define(root, handler: testHandler);
  }
}
