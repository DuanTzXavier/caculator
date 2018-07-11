import 'dart:async';

import 'package:calculator/convert/ConvertModel.dart';
import 'package:calculator/convert/LengthStatic.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExchangeCalculatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExchangeCalculatorScreenState();
}

class ExchangeCalculatorScreenState extends State<ExchangeCalculatorScreen> {
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

    ratio = Decimal.parse(firstModel.absValue) /
        Decimal.parse(secondModel.absValue);
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
            child: initButtons(),)
        ],
      ),);
  }

  Widget initInputedView() {
    return AspectRatio(
      aspectRatio: 7 / 4,
      child: Column(children: <Widget>[
        Expanded(child: GestureDetector(onTap: () {
          _askedToLead(true);
        }, child: Container(
          color: Colors.grey[100],
          child: Row(
            children: <Widget>[
              Container(
                child: Container(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Row(children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 4.0), child: Icon(Icons.print),),
                    Text("${firstModel.name}",
                      style: TextStyle(
                          fontSize: 24.0, color: Colors.grey[800]),),
                    Icon(Icons.arrow_drop_down, color: Colors.grey,),
                  ],),),),
              Expanded(
                child: GestureDetector(onTap: () {
                  setEditNumber(true);
                }, child: Container(padding: EdgeInsets.only(right: 25.0),
                  color: Colors.grey[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("$firstShowText",
                            style: TextStyle(
                                fontSize: 28.0,
                                color: isEditFirst ? Colors.orange : Colors
                                    .grey[800]),),
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
          color: Colors.grey[100],
          child: Row(
            children: <Widget>[
              Container(
                child: Container(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Row(children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 4.0), child: Icon(Icons.print),),
                    Text("${secondModel.name}",
                      style: TextStyle(
                          fontSize: 24.0, color: Colors.grey[800]),),
                    Icon(Icons.arrow_drop_down, color: Colors.grey,),
                  ],),),),
              Expanded(
                child: GestureDetector(onTap: () {
                  setEditNumber(false);
                },
                  child: Container(
                    color: Colors.grey[100],
                    padding: EdgeInsets.only(right: 25.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("$secondShowText",
                              style: TextStyle(
                                  fontSize: 28.0,
                                  color: isEditFirst
                                      ? Colors.grey[800]
                                      : Colors
                                      .orange),),
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
        Divider(height: 0.5,),
        Expanded(child: GestureDetector(onTap: () {
          _askedToLead(true);
        }, child: Container(
          color: Colors.grey[100],
          child: Row(
            children: <Widget>[
              Container(
                child: Container(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Row(children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 4.0), child: Icon(Icons.nature),),
                    Text("${firstModel.name}",
                      style: TextStyle(
                          fontSize: 24.0, color: Colors.grey[800]),),
                    Icon(Icons.arrow_drop_down, color: Colors.grey,),
                  ],),),),
              Expanded(
                child: GestureDetector(onTap: () {
                  setEditNumber(true);
                }, child: Container(padding: EdgeInsets.only(right: 25.0),
                  color: Colors.grey[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("$firstShowText",
                            style: TextStyle(
                                fontSize: 28.0,
                                color: isEditFirst ? Colors.orange : Colors
                                    .grey[800]),),
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
                        initBig0TextButton("0", callback: () {
                          appendNumber("0");
                        }),
                        initButton(".", callback: () {
                          appendNumber(".");
                        }),
                      ])),
                ])),

        Expanded(
            child: Column(
                children: <Widget>[
                  initBigTextButton("AC", callback: () {
                    clearNumber();
                  }),
                  initBigButton(Icons.backspace, callback: () {
                    deleteNumber();
                  }),
                ])),

      ],);
  }

  Widget initButton(String text,
      {GestureTapCallback callback, double size: 26.0, Color color: const Color(
          0xFF303030)}) {
    return Expanded(
      child: new Material(
        color: Colors.white,
        child: new InkWell(onTap: callback,
          child: Container(
            decoration: new BoxDecoration(
              border: new Border.all(
                  width: 0.1,
                  color: Colors.black38),),
            child: Center(
              child: Text(
                text,
                style: TextStyle(fontSize: size, color: color),),),),),),);
  }

  Widget initIconButton(IconData icon,
      {GestureTapCallback callback, double size: 22.0, Color color: const Color(
          0xFF303030)}) {
    return Expanded(
      child: new Material(
        color: Colors.white,
        child: new InkWell(onTap: callback,
          child: Container(
            decoration: new BoxDecoration(
              border: new Border.all(
                  width: 0.1,
                  color: Colors.black38),),
            child: Center(
              child: Icon(
                icon,
                size: size, color: color,),),),),),);
  }

  void setEditNumber(bool isFirst) {
    setState(() {
      isEditFirst = isFirst;
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
        print(firstShowText);
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

  Widget initBigButton(IconData icon, {GestureTapCallback callback}) {
    return Expanded(
      flex: 2,
      child: new Material(
        color: Colors.white,
        child: new InkWell(onTap: callback,
          child: Container(
            decoration: new BoxDecoration(
              border: new Border.all(
                  width: 0.1, color: Colors.black38),),
            child: Center(
              child: Icon(icon,
                size: 26.0, color: Colors.grey[800],),),),),),);
  }

  Widget initBigTextButton(String text, {GestureTapCallback callback}) {
    return Expanded(
      flex: 2,
      child: new Material(
        color: Colors.white,
        child: new InkWell(onTap: callback,
          child: Container(
            decoration: new BoxDecoration(
              border: new Border.all(
                  width: 0.1, color: Colors.black38),),
            child: Center(
              child: Text(text, style: TextStyle(
                  fontSize: 22.0, color: Colors.orange),),),),),),);
  }

  Widget initBig0TextButton(String text, {GestureTapCallback callback}) {
    return Expanded(
      flex: 2,
      child: new Material(
        color: Colors.white,
        child: new InkWell(onTap: callback,
          child: Container(
            decoration: new BoxDecoration(
              border: new Border.all(
                  width: 0.1, color: Colors.black38),),
            child: Row(children: <Widget>[
              Expanded(child: Center(child: Text(text, style: TextStyle(
                  fontSize: 22.0, color: Colors.grey[800]),),),),
              Expanded(child: Center(),),
            ],),),),),);
  }

  Widget initAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[100],
      leading: clickToShowScaffold(
          Icon(Icons.view_module, color: Colors.grey[800])),
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text("长度单位换算", style: TextStyle(color: Colors.grey[800]),),
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
      ratio = Decimal.parse(firstModel.absValue) /
          Decimal.parse(secondModel.absValue);
      setShowText(isEditFirst ? firstShowText : secondShowText);
    });
  }

  loadData() async {
    String dataURL = "http://op.juhe.cn/onebox/exchange/currency?from=CNY&to=USD&key=adb5c331c4588dc32c72332e86b99cfb";
    http.Response response = await http.get(dataURL);
    print(response.body);
//    setState(() {
//
//    });
  }

}