import 'package:flutter/services.dart';

class BPCSaleRankQAChannel {
  static MethodChannel platform =
      const MethodChannel('bitauto.flutter.app/bpc_ranktip');
  static Future<void> callSchema(String schemaString) async {
    try {
      platform.invokeMethod('callSchema', {'schemaURL': schemaString});
    } on PlatformException catch (e) {
      print('PlatformException : ${e.message}.');
    }
  }
}
