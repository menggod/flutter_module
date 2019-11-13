import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class TestPage extends StatelessWidget {
  BuildContext _context;
  var _value;

  void _handleClick(String text) {
    Navigator.of(_context).pushNamed('router/home_page');
    print("menggod--->" + text);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                      color: Colors.cyanAccent,
                      child: Text(
                        "normal",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        _handleClick("raise button");
                      }),
                  IconButton(
                    icon: Icon(
                      Icons.ac_unit,
                      color: Colors.pink,
                    ),
                    onPressed: () {
                      _handleClick("image");
                    },
                  ),
                  Image(
                    image: AssetImage("assets/images/ic_no_more.png"),
                    width: 40,
                    height: 40,
                  ),
                  Image.network(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572328867658&di=06cef3c787d15036494add56832e0021&imgtype=0&src=http%3A%2F%2Fwww.kuaishang.cn%2Fassets%2Fjs%2Fupfiles%2Fimages%2F160419091958808762rbaph.png",
                    width: 40,
                    height: 40,
                  ),
                  GradientButton(
                    child: Text("哈哈"),
                  ),
                  CustomPaintRoute()
//                  ScrollControllerTestRoute()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TestPage2 extends StatefulWidget {
  @override
  _TestPage2State createState() => _TestPage2State();
}

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是互联网上获取的数据");
}

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
}

class _TestPage2State extends State<TestPage2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: <Widget>[
                Text("测试文本文字"),
                StateTest(),
                Container(
                  child: StreamBuilder<int>(
                    stream: counter(),
                    builder: (BuildContext context,
                        AsyncSnapshot<int> snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasError) {
                          return Text("error");
                        } else {
                          return Text("success ${snapshot.data}");
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StateTest extends StatefulWidget {
  @override
  _StateTestState createState() => _StateTestState();
}

class _StateTestState extends State<StateTest> {
  var _value = false;
  PointerEvent _event;
  TextEditingController _unameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          new Switch(
            value: _value,
            activeColor: Colors.purple,
            onChanged: (_value) {
              this.setState(() {
                this._value = !this._value;
              });
            },
          ),
          CheckboxListTile(
            secondary: const Icon(Icons.backspace),
            title: const Text("这个是测试条目"),
            value: this._value,
            onChanged: (bool value) {
              setState(() {
                this._value = !this._value;
              });
            },
          ),
          TextField(
            autofocus: false,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或者邮箱",
                prefixIcon: Icon(Icons.settings)),
            controller: _unameController,
          ),
          LinearProgressIndicator(
              backgroundColor: Colors.blue[300],
              valueColor: AlwaysStoppedAnimation(Colors.red)),
          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          DecoratedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                "login",
                style: TextStyle(color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ],
              borderRadius: BorderRadius.circular(4.0),
              gradient:
              LinearGradient(colors: [Colors.red, Colors.orange[700]]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              color: Colors.yellow,
              child: Column(
                children: <Widget>[
                  Container(
                    transform: Matrix4.rotationX(.3),
                    alignment: Alignment.center,
                    color: Colors.purple,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text("left 8"),
                    ),
                  ),
                  Container(
                    color: Colors.pink,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/ic_no_more.png")),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text("vertical 8"),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
                      child: Text("ltrb   20"),
                    ),
                  ),
                  Listener(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      width: 300.0,
                      height: 150.0,
                      child: Text(_event?.toString() ?? "",
                        style: TextStyle(color: Colors.white),),
                    ),
                    onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
                    onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
                    onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    _unameController.addListener(() {
      print(_unameController.text);
    });
  }
}

class TestPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WillPopScopeTestRoute(),
      ),
    );
  }
}

class ScrollControllerTestRoute extends StatefulWidget {
  @override
  ScrollControllerTestRouteState createState() {
    return new ScrollControllerTestRouteState();
  }
}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滚动控制")),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
            controller: _controller,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("$index"),
              );
            }),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            //返回到顶部时执行动画
            _controller.animateTo(.0,
                duration: Duration(milliseconds: 200), curve: Curves.ease);
          }),
    );
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() =>
      new _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      //进度条
      // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          //return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"));
                }),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        ));
  }
}


class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                //执行缩放动画
                return ScaleTransition(child: child, scale: animation);
              },
              child: Text(
                '$_count',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
              child: const Text('+1',),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    @required this.child,
  });

  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;
  final BorderRadius borderRadius;

  //点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(300, 300), //指定画布大小
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    //画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0x77cdb175); //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 15; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}