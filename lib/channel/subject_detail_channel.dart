import 'package:flutter/services.dart';

const DETAIL_CHANNEL = "bitauto.flutter.app/subjectdetail";

/*
 * 产品跳转
 */
Future<void> detailPopNavigate() async {
  const platform = const MethodChannel(DETAIL_CHANNEL);
  try {
    platform.invokeMethod('pop');
  } on PlatformException catch (e) {}
}

/*
 * 详情封面跳转
 */
Future<void> detailCoverNavigate(String link, String id) async {
  const platform = const MethodChannel(DETAIL_CHANNEL);
  try {
    platform.invokeMethod('subjectcovernavigate', {"schemaURL": link, "id": id});
  } on PlatformException catch (e) {}
}

/*
 * 分享跳转
 */
Future<void> detailShareNavigate(Map<String, String> jsonMap) async {
  const platform = const MethodChannel(DETAIL_CHANNEL);
  try {
    platform.invokeMethod('share', jsonMap);
  } on PlatformException catch (e) {}
}

/*
 * 图片跳转
 */
Future<void> detailImageNavigate(List<String> imageList, int currentIndex) async {
  const platform = const MethodChannel(DETAIL_CHANNEL);
  try {
    platform.invokeMethod('imageclick', {"imageList": imageList, "currentIndex": currentIndex.toString()});
  } on PlatformException catch (e) {}
}

/*
 * 产品跳转
 */
Future<void> detailProductNavigate(int productId) async {
  const platform = const MethodChannel(DETAIL_CHANNEL);
  try {
    platform.invokeMethod('toproduct', {
      'schemaURL': 'bitauto.yicheapp://mall/productdetail?id=${productId.toString()}',
      'productId': productId.toString()
    });
  } on PlatformException catch (e) {}
}
