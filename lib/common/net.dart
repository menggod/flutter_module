import 'package:dio/dio.dart';

class CommonInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    return super.onError(err);
  }
}

class HttpManager {
  static HttpManager _instance;

  static HttpManager getInstance() {
    if (_instance == null) {
      _instance = HttpManager();
    }
    return _instance;
  }

  Dio _dio = Dio();

  HttpManager() {
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
    _dio.interceptors.add(CommonInterceptor());
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<Map<String, dynamic>> get(
      String path, Map<String, dynamic> map) async {
    var response = await getInstance()._dio.get(path, queryParameters: map);
    return processResponse(response);
  }

  dynamic getSimple(String path, Map<String, dynamic> map) async {
    var response = await getInstance()._dio.get(path, queryParameters: map);
    return response;
  }

  Future<Map<String, dynamic>> post(
      String path, Map<String, dynamic> map) async {
    var response = await getInstance()._dio.post(path,
        data: map,
        options: Options(
            contentType: "application/x-www-form-urlencoded",
            headers: {"Content-Type": "application/x-www-form-urlencoded"}));
    return processResponse(response);
  }

  Future<Map<String, dynamic>> processResponse(Response response) async {
    if (response.statusCode == 200) {
      var data = response.data;
      int code = data["code"];
      String msg = data["msg"];
      if (code == 0) {
        //请求响应成功
        return data;
      }
      throw Exception(msg);
    }
    throw Exception("server error");
  }
}
