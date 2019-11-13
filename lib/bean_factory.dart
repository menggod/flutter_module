import 'package:flutter_module/model/bing_img_bean.dart';

class BeanFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BingImgBean") {
      return BingImgBean.fromJson(json) as T;
    } else {
      return null;
    }
  }
}