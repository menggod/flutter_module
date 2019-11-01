import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/net.dart';


import 'common/global.dart';

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
    Global.getInstance().init(context);
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
                  onPressed: (){
//                    _loadData();
                    Toast.show("哈哈",context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class Toast {
  static void show(String message, BuildContext context, {int duration}) {
    OverlayEntry entry = OverlayEntry(builder: (context) {
      return Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.7,
        ),
        alignment: Alignment.center,
        child: Center(
          child: Container(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Material(
                child: Text(
                  message,
                  style: TextStyle(),
                ),
              ),
            ),
          ),
        ),
      );
    });

    Overlay.of(context).insert(entry);
    Future.delayed(Duration(seconds: duration ?? 2)).then((value) {
      // 移除层可以通过调用OverlayEntry的remove方法。
      entry.remove();
    });
  }
}

