import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/channel/bpc_salerankqa_channel.dart';

void main() {
  Map<String, dynamic> params = <String, dynamic>{"qaType": 1};

  runApp(new sale_rank_qa(params));
}

double screenWidth;
num appBarBgAlpha = 0;

double width;
var qaType = 0; //0是车型,1是互动

class sale_rank_qa extends StatelessWidget {
  sale_rank_qa(Map<String, dynamic> params) {
    if (params != null && params.isNotEmpty) {
      qaType = params["qaType"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
      body: BodyPage(),
      backgroundColor: Colors.white,
    ));
  }
}

class BodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double paddingTop = 0;

    return new Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        centerTitle: true,
        title: Text(
          qaType == 1 ? "常见问题" : "说明",
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 34, 34, 34),
          ),
        ),
        backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Image.asset(
              'images/ic_back_black.png',
              width: 24,
              height: 24,
            ),
            onPressed: () => exitQa(),
          );
        }),
      ),
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              _buildCourse(paddingTop),
            ],
          )),
      backgroundColor: Colors.white,
    );
  }
}

var tips;

Widget _buildCourse(double paddingTop) {
  initData();

  return new ListView.builder(
      padding: EdgeInsets.only(left: 20, top: 4, right: 20, bottom: 20),
      itemCount: tipsSize,
      itemBuilder: (context, i) {
        return _buildRow(i);
      });
}

var tipsSize = 0;

void initData() {
  var carmodelLines = 14;
  var carmodelTips = List<String>(carmodelLines);

  var vipLines = 22;
  var viplTips = List<String>(vipLines);

  var appraiseLines = 8;
  var appraiseTips = List<String>(appraiseLines);

  carmodelTips[0] = "销量数据展示时间";
  carmodelTips[1] = "每月的12日左右更新上月销量数据";
  carmodelTips[2] = "销量数据来源";
  carmodelTips[3] = "销量数据来自乘联会，每月初各汽车厂家会将经销商批发的车型总数量提报到乘联会，如果厂家发布了月销量数据，会优先采用";
  carmodelTips[4] = "销量排行的数据准确性";
  carmodelTips[5] = "会严格按着车系对应的原则展示乘联会和厂家提供的数据，准确率为99.99%，也可通过下载原始数据进行比对，欢迎纠错";
  carmodelTips[6] = "为什么未上市有销量";
  carmodelTips[7] = "乘联会得到的数据为厂家向经销商批发的车型总数量，未上市之前的经销商铺货也会统计到销量中";
  carmodelTips[8] = "为什么没有进口车销量";
  carmodelTips[9] = "乘联会仅统计非进口车型的销量数据，如果得到了进口车的销量数据也会在销量排行中展示";
  carmodelTips[10] = "为什么没有商用车销量";
  carmodelTips[11] = "商用车大部分厂家仅提供批发总量，数据无法对应到每个车系，能对应到车系的数据会在销量排行中展示";
  carmodelTips[12] = "和上月相比为什么部分车系销量数据会有很大的浮动";
  carmodelTips[13] = "受限于厂家内部的调整和国家政策的变化，每月的批发量也是不同的，甚至可以为0";

  viplTips[0] = "1、为什么查不了违章？";
  viplTips[1] =
      "我们的违章数据来自各地交管局，具有很高的准确性，但有时候可能会出现系统繁忙或者维护的情况，请您换个时间段再次进行查询。部分地区交管局暂时不支持线上查询功能，我们在积极拓展中，建议您直接在当地交通队进行相关业务。";
  viplTips[2] = "2、如何更新违章信息？";
  viplTips[3] = "点击“违章查询”按钮，或者进入爱车下方的违章信息页，即可更新信息。";
  viplTips[4] = "3、为何我的违章地在地图显示不准确？";
  viplTips[5] = "该功能由第三方提供，地图位置显示仅作为参考，如有偏差以判决书实际展示为准。";
  viplTips[6] = "4、为什么我从未到达某地，确收到了异地罚单信息？";
  viplTips[7] = "此情况疑似异地套牌违章，建议尽快与当地交通队进行信息核实。";
  viplTips[8] = "5、为什么我显示的罚款金额和罚分与在线下实际缴纳时不符？";
  viplTips[9] = "我们的数据均来自于各地交管局，有可能存在同步不及时的情况，如对违章处理结果有异议建议与当地交通队进行信息核实，以线下结果为准。";
  viplTips[10] = "6、已收到罚单，为什么未显示违章？";
  viplTips[11] = "全国各地交管局信息录入和更新频率不同，一般新违章1-3个工作日后可以查询，个别地区需要7天左右，请您随时保持关注哦。";
  viplTips[12] = "7、代缴已办理成功，为什么还能差到违章信息？";
  viplTips[13] = "请放心，该违章信息已经在交管局内网处理完成，但全国各地交管系统信息录入和更新时间不同，一般已处理的违章在3-7个工作日内信息同步，不会影响您办理年检，验车，过户等业务。";
  viplTips[14] = "8、扣分的罚款能否代缴";
  viplTips[15] = "目前只针对不扣分的违章进行代缴，扣分的违章暂不支持，请您持续关注哦";
  viplTips[16] = "9、为什么下单后通知办理失败";
  viplTips[17] = "车行易平台所查询到的违章，如提示可下单均可以办理，但受代办系统及当地政策影响，少部分违章会办理失败导致退单，退单原因可详询客服，所有的退单订单均全额退款3-5工作日退回原支付账户";
  viplTips[18] = "10、为什么找不到我的车型？";
  viplTips[19] = "车型的选择并不影响您的违章查询结果，我们也会尽快完善车型库信息。";
  viplTips[20] = "11、货车、挂车、教练车、摩托车、客车、军车等能进行违章查询吗？";
  viplTips[21] = "抱歉，目前我们只支持乘用车查询。";

  appraiseTips[0] = "点评排行的数据来源";
  appraiseTips[1] = "基于易车真实车主对车型的外观、动力、空间、舒适性、操控、油耗等多维度的真实评价";
  appraiseTips[2] = "车主从哪里评价呢？";
  appraiseTips[3] = "在易车APP首页右侧浮球或者具体的某个车型页点评页签下进行点评";
  appraiseTips[4] = "每个车型的分数怎么算的";
  appraiseTips[5] = "基于每一个车主对车型的综合评分，再通过易车大数据计算得出（数据仅供参考）";
  appraiseTips[6] = "满分是多少分";
  appraiseTips[7] = "我们采用的十分制";

  switch (qaType) {
    case 1:
      {
        tips = viplTips;
        tipsSize = vipLines;
      }
      break;
    case 2:
      {
        tips = appraiseTips;
        tipsSize = appraiseLines;
      }
      break;
    default:
      tips = carmodelTips;
      tipsSize = carmodelLines;
  }
}

Widget _buildRow(int index) {
  double topPadding = 12;
  if (index == 0) {
    topPadding = 12;
  } else {
    if (index.isOdd) {
      topPadding = 8;
    } else {
      topPadding = 24;
    }
  }

  if (tips[index] != null) {
    return new Stack(
//      direction: Axis.horizontal,
//      runSpacing: topPadding,
//      alignment: WrapAlignment.start,
      alignment: Alignment.topLeft,
      overflow: Overflow.visible,

      children: <Widget>[
        Padding(
          padding: new EdgeInsets.only(top: topPadding),
          child: Image.asset(
            index.isOdd ? 'images/ic_carmodel_a.png' : 'images/ic_carmodel_q.png',
            width: 20,
            height: 20,
          ),
        ),
        Stack(
          children: <Widget>[
            buildTitle(index, topPadding),
          ],
//
//          height: MainAxisSize.max,
        )
      ],

//      subtitle: ,
    );
  } else {
    return null;
  }
}

Widget buildTitle(int index, double topPadding) {
  return new Padding(
    padding: new EdgeInsets.only(left: 24, top: topPadding),
    child: new Text(
      tips[index],
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: index.isOdd ? FontWeight.w400 : FontWeight.w700,
        color: Color.fromARGB(255, 34, 34, 34),
      ),
    ),
  );
}
