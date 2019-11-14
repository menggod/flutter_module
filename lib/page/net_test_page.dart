import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/bing_img_bean.dart';

const String url = "http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-CN";
const String ganhuo_url = "http://gank.io/api/data/福利/6/1";
const String img_url =
    "http://cn.bing.com/th?id=OHR.BerlinerMauerFall_ZH-CN1154604596_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp";

void main() => runApp(NetTestPage());

class NetTestPage extends StatefulWidget {
  @override
  _NetTestPageState createState() => _NetTestPageState();
}

class _NetTestPageState extends State<NetTestPage> with WidgetsBindingObserver {
//  Response _response;
  String _response;
  bool _testBool = false;
  String _imageUrl;

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

  Future _loadData() async {
    try {
      var response = await Dio().get(url);
      var bingImgBean = BingImgBean.fromJson(response.data);
      setState(() {
        _response = bingImgBean.images[0].copyright;
        _imageUrl = "http://cn.bing.com" + bingImgBean.images[0].url;
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40),
                  child: RaisedButton(
                    child: Text("获取bing图片"),
                    onPressed: () {
                      _loadData();
                      setState(() {
                        _testBool = !_testBool;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: _response == null ? false : true,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Image.network(_imageUrl ?? ""),
                      Text(
                        _response ?? "",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 8, color: Color(0xff81d8d0)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
