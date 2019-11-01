import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/net.dart';

final String url = "http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-CN";
final String ganhuo_url = "http://gank.io/api/data/福利/6/1";


void main() => runApp(NetTestPage());

class NetTestPage extends StatefulWidget {
  @override
  _NetTestPageState createState() => _NetTestPageState();
}


class _NetTestPageState extends State<NetTestPage> {


  void _loadData() async {
    try {
      Response response =  HttpManager.getInstance().getSimple(url, {});
      print(response);
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("获取bing图片"),
                onPressed: (){
                  _loadData();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

