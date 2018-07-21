import 'dart:async';

import 'package:calculator/convert/ConvertModel.dart';
import 'package:calculator/convert/LengthStatic.dart';
import 'package:calculator/static/MyColors.dart';
import 'package:calculator/static/MyDoubleSize.dart';
import 'package:calculator/utils/ShowTextNumberUtil.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class ConvertCalculatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ConvertCalculatorScreenState();
}

class ConvertCalculatorScreenState extends State<ConvertCalculatorScreen> {

  String firstShowText;
  String secondShowText;
  bool isEditFirst;
  Decimal ratio;

  ConvertModel firstModel;
  ConvertModel secondModel;

  @override
  void initState() {
    super.initState();
    firstShowText = "1";
    isEditFirst = true;

    firstModel = LengthStatic.meter;
    secondModel = LengthStatic.kilometer;

    ratio = firstModel.absValue /
        secondModel.absValue;
    setShowText(firstShowText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar(),
      body: Column(
        children: <Widget>[
          initInputedView(),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              color: MyColors.colorfefefe, child: initButtons(),),)
        ],
      ),);
  }

  Widget initInputedView() {
    return AspectRatio(
      aspectRatio: 7 / 5,
      child: Column(children: <Widget>[
        Expanded(child: GestureDetector(onTap: () {
          _askedToLead(true);
        }, child: Container(
          color: MyColors.colorfefefe,
          child: Row(
            children: <Widget>[
              Container(
                child: Container(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Row(children: <Widget>[
                    Text("${firstModel.name}",
                      style: TextStyle(
                          fontSize: 18.0, color: Colors.grey[800]),),
                    Icon(Icons.arrow_drop_down, color: Colors.grey,),
                  ],),),),
              Expanded(
                child: GestureDetector(onTap: () {
                  if (!isEditFirst) {
                    setEditNumber(true);
                  }
                }, child: Container(padding: EdgeInsets.only(right: 25.0),
                  color: MyColors.colorfefefe,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("${ShowTextNumberUtil.showTextNumberFromString(
                              firstShowText, maxValue: "9999999999999")}",
                            style: TextStyle(
                                fontSize: 24.0,
                                color: isEditFirst
                                    ? MyColors.color333333
                                    : MyColors.color757c87),),
                        ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 2.0),
                            child: Text("${firstModel.unit}",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[800]),),),
                        ],),
                    ],),),)
                ,),
            ],),),),),
        Divider(
          height: 0.5,
        ),
        Expanded(child: GestureDetector(onTap: () {
          _askedToLead(false);
        }, child: Container(
          color: MyColors.colorfefefe,
          child: Row(
            children: <Widget>[
              Container(
                child: Container(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Row(children: <Widget>[
                    Text("${secondModel.name}",
                      style: TextStyle(
                          fontSize: 18.0, color: Colors.grey[800]),),
                    Icon(Icons.arrow_drop_down, color: Colors.grey,),
                  ],),),),
              Expanded(
                child: GestureDetector(onTap: () {
                  if (isEditFirst) {
                    setEditNumber(false);
                  }
                },
                  child: Container(
                    color: MyColors.colorfefefe,
                    padding: EdgeInsets.only(right: 25.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("${ShowTextNumberUtil.showTextNumberFromString(
                                secondShowText, maxValue: "9999999999999")}",
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: isEditFirst
                                      ? MyColors.color757c87
                                      : MyColors.color333333),),
                          ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 2.0),
                              child: Text("${secondModel.unit}",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey[800]),),),
                          ],),
                      ],),)
                  ,)
                ,),
            ],),),),),
      ],),);
  }

  Widget initButtons() {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Column(
                children: <Widget>[
                  Expanded(child: Row(
                      children: <Widget>[
                        initButton("7", callback: () {
                          appendNumber("7");
                        }),
                        initButton("8", callback: () {
                          appendNumber("8");
                        }),
                        initButton("9", callback: () {
                          appendNumber("9");
                        }),
                      ])),
                  Expanded(child: Row(
                      children: <Widget>[
                        initButton("4", callback: () {
                          appendNumber("4");
                        }),
                        initButton("5", callback: () {
                          appendNumber("5");
                        }),
                        initButton("6", callback: () {
                          appendNumber("6");
                        }),
                      ])),
                  Expanded(child: Row(
                      children: <Widget>[
                        initButton("1", callback: () {
                          appendNumber("1");
                        }),
                        initButton("2", callback: () {
                          appendNumber("2");
                        }),
                        initButton("3", callback: () {
                          appendNumber("3");
                        }),
                      ])),

                  Expanded(child: Row(
                      children: <Widget>[
                        initButton("0", callback: () {
                          appendNumber("0");
                        }),
                        initButton(".", callback: () {
                          appendNumber(".");
                        }),
                        Expanded(
                            child: Container()),
                      ])),
                ])),

        Expanded(
            child: Column(
                children: <Widget>[
                  initBigTextButton("AC", callback: () {
                    clearNumber();
                  }),
                  initBigButton(callback: () {
                    deleteNumber();
                  }),
                ])),

      ],);
  }

  Widget initButton(String text,
      {GestureTapCallback callback, double size: MyDoubleSize
          .double26, Color color}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(MyDoubleSize.double5), child: new Material(
        shape: CircleBorder(),
        color: MyColors.colorfefefe,
        child: new InkWell(onTap: callback,
          child: Container(
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: size, color: MyColors.color757c87),),),),),),),);
  }

  void setEditNumber(bool isFirst) {
    setState(() {
      isEditFirst = isFirst;
      setShowText("1");
    });
  }

  void appendNumber(String append) {
    String showText = isEditFirst ? firstShowText : secondShowText;

    switch (append) {
      case "%":
        if (showText.isEmpty) {
          break;
        }
        showText =
            (Decimal.parse(showText) / Decimal.fromInt(100)).toString();
        break;
      case ".":
        if (showText.contains(".")) {
          break;
        }
        if (showText.isEmpty) {
          showText = "0";
        }
        showText += append;
        break;
      default:
        if (showText == "0") {
          showText = append;
        } else {
          showText += append;
        }
        break;
    }

    setShowText(showText);
  }

  void setShowText(String showText) {
    setState(() {
      if (isEditFirst) {
        firstShowText = showText;
        secondShowText = (Decimal.parse(
            showText.endsWith(".") ? showText.replaceAll(".", "") : showText) *
            ratio).toString();
      } else {
        secondShowText = showText;
        firstShowText = (Decimal.parse(
            showText.endsWith(".") ? showText.replaceAll(".", "") : showText) /
            ratio).toString();
      }
    });
  }

  void clearNumber() {
    setShowText("0");
  }

  Widget initBigButton({GestureTapCallback callback}) {
    return Expanded(
      flex: 2,
      child: Container(padding: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: MyDoubleSize.double5,
          bottom: MyDoubleSize.double5), child: new Material(
        borderRadius: BorderRadius.all(Radius.circular(1000.0)),
        color: MyColors.colorf9f9f9,
        child: new InkWell(onTap: callback,
          child: Container(
            child: Center(
              child: Image.asset(
                'assets/images/backspace.png', width: 28.0,),),),),),),);
  }

  Widget initBigTextButton(String text, {GestureTapCallback callback}) {
    return Expanded(
      flex: 2,
      child: Container(padding: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: MyDoubleSize.double5,
          bottom: MyDoubleSize.double5), child: new Material(
        borderRadius: BorderRadius.all(Radius.circular(1000.0)),
        color: MyColors.colorf9f9f9,
        child: new InkWell(onTap: callback,
          child: Container(
            child: Center(
              child: Text(text, style: TextStyle(
                  fontSize: 22.0, color: MyColors.color757c87),),),),),),),);
  }

  Widget initAppBar() {
    return AppBar(
      backgroundColor: MyColors.colorfefefe,
      leading: clickToShowScaffold(
          Padding(padding: EdgeInsets.all(13.0), child: Image.asset(
            'assets/images/left_icon.png',
            fit: BoxFit.fill,
          ),)
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text("长度单位换算", style: TextStyle(color: MyColors.color333333),),
      elevation: 0.0,
    );
  }

  Builder clickToShowScaffold(Widget widget) {
    return new Builder(builder: (BuildContext context) {
      return GestureDetector(child: widget, onTap: () {
        Navigator.pop(context);
      },);
    });
  }

  void deleteNumber() {
    String showText = isEditFirst ? firstShowText : secondShowText;
    if (showText.length < 2) {
      showText = "0";
    } else {
      showText = showText.substring(0, showText.length - 1);
    }
    setShowText(showText);
  }

  Future<Null> _askedToLead(bool isClickFirst) async {
    var resultModel = await showDialog<ConvertModel>(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: Center(
              child: Text("选择单位", style: TextStyle(fontSize: 14.0),),),
            titlePadding: EdgeInsets.all(10.0),
            children: getConvertList(),
          );
        }
    );
    if (resultModel != null) {
      if (isClickFirst) {
        firstModel = resultModel;
      } else {
        secondModel = resultModel;
      }
      reloadData();
    }
  }

  List<Widget> getConvertList() {
    List<Widget> converts = List();
    for (var convert in LengthStatic.lengths) {
      converts.add(SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, convert);
          },
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Text("${convert.name}", style: TextStyle(fontSize: 14.0),),
                Text(
                  " " + "${convert.unit}", style: TextStyle(fontSize: 12.0),),
              ],),
            ],
          ))
        ,
      );
    }
    return converts;
  }

  void reloadData() {
    setState(() {
      ratio = (firstModel.absValue) /
          (secondModel.absValue);
      setShowText(isEditFirst ? firstShowText : secondShowText);
    });
  }
}