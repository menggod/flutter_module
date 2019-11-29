import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MainChannel {
  static MethodChannel platform =
      const MethodChannel('bitauto.flutter.app/main');

  static Future<void> collectLog(String line) async {
//    print('flutterMain:$line');
    try {
      platform.invokeMethod('collectLog', line);
    } on PlatformException catch (e) {
      print('PlatformException : ${e.message}.');
    }
  }

  static Future<void> reportErrorAndLog(FlutterErrorDetails details) async {
//  print('flutterMain: ${details.exceptionAsString()}');
    try {
      platform.invokeMethod('reportErrorAndLog', {
        'exception':details.exceptionAsString()??"",
        'context': details.context??"",
        'library': details.library??"",
        'stack': details.stack.toString()??"",
      });
    } on PlatformException catch (e) {
      print('PlatformException : ${e.message}.');
    }
  }

}
