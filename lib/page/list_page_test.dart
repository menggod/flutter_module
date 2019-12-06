import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean.dart';

final List<TestItemBean> _list = [
  TestItemBean(1, "点评排行的数据来源"),
  TestItemBean(1, "基于易车真实车主对车型的外观、动力、空间、舒适性、操控、油耗等多维度的真实评价"),
  TestItemBean(1, "车主从哪里评价呢?"),
  TestItemBean(1, "在易车APP首页右侧浮球或者具体的某个车型页点评页签下进行点评"),
  TestItemBean(1, "每个车型的分数怎么算的"),
  TestItemBean(1, "基于每一个车主对车型的综合评分，再通过易车大数据计算得出（数据仅供参考）"),
  TestItemBean(1, "基于每一个车主对车型的综合评分，再通过易车大数据计算得出（数据仅供参考）"),
  TestItemBean(1, "基于每一个车主对车型的综合评分，再通过易车大数据计算得出（数据仅供参考）"),
  TestItemBean(1, "基于每一个车主对车型的综合评分，再通过易车大数据计算得出（数据仅供参考）"),
  TestItemBean(1, "基于每一个车主对车型的综合评分，再通过易车大数据计算得出（数据仅供参考）"),
  TestItemBean(1, "基于每一个车主对车型的综合评分，再通过易车大数据计算得出（数据仅供参考）"),
  TestItemBean(1, "基于每一个车主对车型的综合评分，再通过易车大数据计算得出（数据仅供参考）"),
  TestItemBean(1, "基于每一个车主对车型的综合评分，再通过易车大数据计算得出（数据仅供参考）"),
  TestItemBean(1, "基于每一个车主对车型的综合评分，再通过易车大数据计算得出（数据仅供参考）"),
  TestItemBean(1, "满分是多少分"),
  TestItemBean(1, "我们采用的十分制"),
  TestItemBean(1, "我们采用的十分制"),
  TestItemBean(1, "我们采用的十分制"),
  TestItemBean(1, "我们采用的十分制"),
  TestItemBean(1, "我们采用的十分制"),
  TestItemBean(1, "我们采用的十分制"),
  TestItemBean(1, "我们采用的十分制"),
  TestItemBean(1, "我们采用的十分制"),
  TestItemBean(1, "我们采用的十分制"),
  TestItemBean(2, "这个是尾巴"),
];



class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return TestItemView(_list[index], index);
          }),
    );
  }
}

class TestItemView extends StatelessWidget {
  TestItemBean _bean;
  int _index;
  Widget _widget;

  TestItemView(this._bean, this._index);

  @override
  Widget build(BuildContext context) {

    double topPadding = 12;
    if (_index == 0) {
      topPadding = 12;
    } else {
      if (_index.isOdd) {
        topPadding = 8;
      } else {
        topPadding = 24;
      }
    }

    switch (_bean.type) {
      case 1:
        {
          _widget = Stack(
            alignment: Alignment.topLeft,
            overflow: Overflow.visible,
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.only(top: topPadding),
                child: Image.asset(
                  _index.isOdd ? 'images/ic_carmodel_a.png' : '/images/ic_carmodel_q.png',
                  width: 20,
                  height: 20,
                ),
              ),
              Stack(
                children: <Widget>[
                  buildTitle(_index, topPadding),
                ],
              )
            ],
          );
        }
        break;
      case 2:
        {
          _widget =Text("2");
        }
        break;
      default:
        _widget =Text("default");
    }
    return _widget;
  }
}

Widget buildTitle(int index, double topPadding) {
  return new Padding(
    padding: new EdgeInsets.only(left: 24, top: topPadding),
    child: new Text(
      _list[index].title,
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: index.isOdd ? FontWeight.w400 : FontWeight.w700,
        color: Color.fromARGB(255, 34, 34, 34),
      ),
    ),
  );
}
