import 'package:flutter/services.dart';

class SubjectChannel {
  static MethodChannel platform =
      const MethodChannel('bitauto.flutter.app/subject');

  static Future<void> toSubjectDetail(String subjectID) async {
    try {
      platform.invokeMethod('tosubjectdetail',
          {'schemaURL': 'bitauto.yicheapp://mall/subjectdetail?id=$subjectID'});
    } on PlatformException catch (e) {
      print('PlatformException : ${e.message}.');
    }
  }

  static Future<void> toProductDetail(String productID) async {
    try {
      platform.invokeMethod('toproduct',
          {'schemaURL': 'bitauto.yicheapp://mall/productdetail?id=$productID'});
    } on PlatformException catch (e) {
      print('PlatformException : ${e.message}.');
    }
  }

  static Future<void> setScrollenabled(bool isScrollenabled) async {
    try {
      print('MethodChannel setScrollenabled $isScrollenabled');
      platform.invokeMethod('scrollenabled', isScrollenabled);
    } on PlatformException catch (e) {
      print('PlatformException : ${e.message}.');
    }
  }
}
