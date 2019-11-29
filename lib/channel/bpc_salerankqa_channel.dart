import 'package:flutter/services.dart';

const DETAIL_CHANNEL = "bitauto.flutter.app/bpc_salerankqa";
/*
 * 退出
 */
Future<void> exitQa() async {
  const platform = const MethodChannel(DETAIL_CHANNEL);
  try {
    platform.invokeMethod('pop');
  } on PlatformException catch (e) {}
}
