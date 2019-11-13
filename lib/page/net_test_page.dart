import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/bean_factory.dart';
import 'package:flutter_module/common/net.dart';

import '../common/global.dart';
import '../model/bing_img_bean.dart';

final String url =
    "http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-CN";
final String ganhuo_url = "http://gank.io/api/data/福利/6/1";

void main() => runApp(NetTestPage());

class NetTestPage extends StatefulWidget {
  @override
  _NetTestPageState createState() => _NetTestPageState();
}

class _NetTestPageState extends State<NetTestPage> with WidgetsBindingObserver {
//  Response _response;
  String _response;
  bool _testBool = false;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  void _loadData() {
    try {
      var response = HttpManager.getInstance().getSimple(url);
      BingImgBean bingImgBean = BeanFactory.generateOBJ<BingImgBean>(response.data.toString());
      setState(() {
            _response = response.data.toString();
          });
    } catch (e) {
      print(e);
    }
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  void _loadData2() async {
    Response future = await Dio().get(url);
    setState(() {
      _response = future.data.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("获取bing图片"),
                  onPressed: () {
                    _loadData();
                    setState(() {
                      _testBool = !_testBool;
                    });
                  },
                ),
                Visibility(
                  visible: _response == null ? false : true,
                  child: Text(_response == null ? "" : _response),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
