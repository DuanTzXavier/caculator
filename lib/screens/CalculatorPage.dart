import 'package:calculator/screens/CategoryCalculatorScreen.dart';
import 'package:calculator/screens/HomeScreen.dart';
import 'package:calculator/static/MyColors.dart';
import 'package:calculator/static/MyDoubleSize.dart';
import 'package:calculator/utils/OperateUtil.dart';
import 'package:calculator/utils/SaveCacheUtil.dart';
import 'package:calculator/utils/ShowTextNumberUtil.dart';
import 'package:calculator/utils/UIUtil.dart';
import 'package:calculator/viewmodel/Statement.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:intl/intl.dart';

class CalculatorPage extends State<HomeScreen> {
  String showText = "0";
  String resultNumber = "0";
  List<Statement> statements = List();
  Statement statement = Statement();
  bool isShowResult = false;
  bool isAllClear = true;
  NumberFormat format = NumberFormat();
  double bigSize = 45.0;
  double smallSize = 22.0;

  @override
  void initState() {
//    initStatements();
    super.initState();
    if (statements == null) {
      statements = List();
    }
  }

  initStatements() async {
    var stateList = await SaveCacheUtil.getStatements();
    var showText = await SaveCacheUtil.getFromCache("showText");
    var resultNumber = await SaveCacheUtil.getFromCache("resultNumber");
    var isShowResult = await SaveCacheUtil.getFromCache("isShowResult");
    var isAllClear = await SaveCacheUtil.getFromCache("isAllClear");
    var operator = await SaveCacheUtil.getFromCache("statement.operator");
    var inputNumber = await SaveCacheUtil.getFromCache("statement.inputNumber");
    setState(() {
      statements = stateList;
      this.showText = showText;
      this.resultNumber = resultNumber == "null" ? "0" : resultNumber;
      this.isShowResult = isShowResult == "null" ? "0" : isShowResult;
      this.isAllClear = isAllClear == "null" ? true : isAllClear;
      this.statement.operator = operator;
      this.statement.inputNumber =
      inputNumber == "null" ? null : Decimal.parse(inputNumber);
    });
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    SaveCacheUtil.saveStatements(statements);
    SaveCacheUtil.saveToCache("showText", showText);
    SaveCacheUtil.saveToCache("resultNumber", resultNumber);
    SaveCacheUtil.saveToCache("isShowResult", isShowResult);
    SaveCacheUtil.saveToCache("isAllClear", isAllClear);
    SaveCacheUtil.saveToCache("statement.operator", statement.operator);
    SaveCacheUtil.saveToCache(
        "statement.inputNumber", statement.inputNumber.toString());
  }


  @override
  Widget build(BuildContext context) {
    var screenWidth = UIUtil.getScreenWidth(context);
    bigSize = screenWidth / 9;
    smallSize = screenWidth / 12;
    return Scaffold(
      appBar: initAppBar(),
      body: Column(
        children: <Widget>[
          initInputedView(),
          Expanded(
            child: Container(padding: EdgeInsets.only(bottom: 20.0),
              color: MyColors.colorfefefe,
              child: initButtons(),),)
        ],
      ),
    );
  }

  Widget initResult() {
    return Align(alignment: Alignment.bottomRight, child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 5.0),
          child: Icon(MdiIcons.equal, size: 20.0,
            color: MyColors.colorbfbfbf,),),
        Text('${ShowTextNumberUtil.showTextNumberFromString(resultNumber)}',
          style: TextStyle(
              fontSize: 25.0, color: MyColors.colorbfbfbf),),
      ],),);
  }

  Widget initInputedView() {
    return AspectRatio(
      aspectRatio: 8 / 4,
      child: Container(color: MyColors.colorfefefe,
        padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 10.0),
        child: ListView.builder(
          reverse: true,
          itemCount: statements.length == 0 ? 1 : statements.length + 2,
          itemBuilder: (BuildContext context, int position) {
            Widget widget;

            if (position == 0 && statements.length > 0) {
              bool isblock = statements[statements.length - 1].operator == 5;
              widget = Opacity(
                opacity: isShowResult || isblock ? 0.0 : 1.0,
                child: initResult(),);
            } else
            if (position == 0 || (position == 1 && statements.length > 0)) {
              IconData operatorIcon = OperateUtil.getStatementOperatorIcon(
                  statement.operator);
              var result = ShowTextNumberUtil.showTextNumber(
                  statement.inputNumber);

              String showNumber = isShowResult ? result
                  .toString() : ShowTextNumberUtil
                  .showTextInputNumberFromString(showText);
              widget = Row(
                mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(operatorIcon,
                    color: MyColors.color757c87,
                    size: showNumber.length > 13 ? smallSize : bigSize,),),
                Text('$showNumber',
                  style: TextStyle(
                      color: MyColors.color757c87,
                      fontSize: showNumber.length > 13 ? smallSize : bigSize),),
              ],);
            } else {
              int index = statements.length + 1 - position;
              String number = statements[index].inputNumber.toString();
              IconData operatorIcon = OperateUtil.getStatementOperatorIcon(
                  statements[index].operator);
              widget =
                  Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(operatorIcon, size: 24.0,
                            color: MyColors.color757c87,),),
                        Text('${ShowTextNumberUtil.showTextNumberFromString(
                            number)}',
                          style: TextStyle(
                              fontSize: 24.0, color: MyColors.color757c87),),
                      ],),

                    Offstage(
                      offstage: statements[index].operator == 5 ? false : true,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Divider(color: MyColors.colore3e5e7,),),),
                  ],);
            }

            return widget;
          },),),);
  }

  Widget initButtons() {
    return Column(
      children: <Widget>[
        Expanded(child: Row(
            children: <Widget>[
              initBGButton(
                  isAllClear ? "AC" : "C", callback: () {
                clearNumber();
              }),
              initIconButton('assets/images/percent.png', callback: () {
                appendNumber("%");
              }),
              initIconButton('assets/images/division.png', callback: () {
                addOperator(4);
              }),
              initIconButton(
                  'assets/images/backspace.png', size: 32.0, callback: () {
                deleteNumber();
              }),
            ])),

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
              initIconButton(
                  'assets/images/times.png', size: 19.0, callback: () {
                addOperator(3);
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
              initIconButton('assets/images/minus.png', callback: () {
                addOperator(2);
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
              initIconButton('assets/images/add.png', callback: () {
                addOperator(1);
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
              initBigButton(callback: () {
                showResult();
              }),
            ])),

      ],);
  }

  void appendNumber(String append) {
    setState(() {
      if (statement.operator == 5) {
        addStatement();
        showText = "0";
        isShowResult = false;
      }
      isAllClear = false;

      if (showText != null && showText.isNotEmpty && showText.length > 14) {
        return;
      }

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
          if (showText == "0" || statement.inputNumber == null) {
            showText = append;
          } else {
            showText += append;
          }
          break;
      }

      statement.inputNumber = Decimal.parse(
          showText.endsWith(".") ? showText.replaceAll(".", "") : showText);

      calculateResult();
    });
  }

  void clearNumber() {
    setState(() {
      initCalculateValue();
    });
  }

  void addOperator(int operator) {
    setState(() {
      if (statement.operator == 5) {
        addStatement(inputNumber: statement.inputNumber);
        isShowResult = false;
      }
      if (statement.inputNumber == null && (statements.length == 0 ||
          (statements.length > 0 &&
              statements[statements.length - 1].operator == 5))) {
        statement.inputNumber = Decimal.fromInt(0);
      }
      if (!statements.contains(statement) && statement.inputNumber != null) {
        addStatement();
      }
      statement = Statement();
      statement.operator = operator;
      showText = "";
      isAllClear = false;
      calculateResult();
    });
  }

  void calculateResult() {
    setState(() {
      Decimal result = Decimal.fromInt(0);
      try {
        for (int i = 0; i < statements.length; i ++) {
          result = OperateUtil.calculateStatement(result, statements[i]);
        }
        result = OperateUtil.calculateStatement(result, statement);
        resultNumber = result.toString();
      } on Exception catch (_) {
        resultNumber = "Error";
      } catch (_) {
        resultNumber = "Error";
      }
    });
  }

  void showResult() {
    setState(() {
      if (statement.operator == 5 ||
          (statement.inputNumber == null && showText == "0")) {
        return;
      }
      if (statement.inputNumber != null) {
        addStatement();
      }
      statement.inputNumber = Decimal.parse(resultNumber);
      statement.operator = 5;
      isShowResult = true;
    });
  }

  void initCalculateValue() {
    isShowResult = false;
    showText = "0";
    resultNumber = "0";
    statement = Statement();

    if (isAllClear) {
      statements.clear();
    } else {
      isAllClear = true;
      for (int i = statements.length; i > 0; i --) {
        if (statements[i - 1].operator != 5) {
          statements.remove(statements[i - 1]);
        } else {
          break;
        }
      }
    }
  }


  void deleteNumber() {
    setState(() {
      if (statement.operator == 5) {
        return;
      }
      if (showText.length < 2 || showText == "0.") {
        showText = statement.operator == 0 ? "0" : "";
      } else {
        showText = showText.substring(0, showText.length - 1);
      }
      if (showText.length < 1) {
        statement.inputNumber =
        statement.operator > 2 ? Decimal.fromInt(1) : Decimal.fromInt(0);
      } else {
        statement.inputNumber = Decimal.parse(
            showText.endsWith(".") ? showText.replaceAll(".", "") : showText);
      }

      caclulateStatement();
    });
  }

  void caclulateStatement() {
    calculateResult();
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

  Widget initBGButton(String text,
      {GestureTapCallback callback, double size: MyDoubleSize.double26}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(MyDoubleSize.double5), child: new Material(
        shape: CircleBorder(),
        color: MyColors.colorf9f9f9,
        child: new InkWell(onTap: callback,
          child: Container(
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size, color: MyColors.color757c87),),),),),),),);
  }

  Widget initIconButton(String assertName,
      {GestureTapCallback callback, double size: 25.0,}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(MyDoubleSize.double5), child: new Material(
        shape: CircleBorder(),
        color: MyColors.colorf9f9f9,
        child: new InkWell(onTap: callback,
          child: Container(
            child: Center(
              child: Image.asset(
                assertName, width: size, height: size,),),),),),),);
  }

  Widget initBigButton({GestureTapCallback callback}) {
    return Expanded(
      flex: 2,
      child: Container(padding: EdgeInsets.only(
          left: MyDoubleSize.double15,
          right: MyDoubleSize.double15,
          top: MyDoubleSize.double5,
          bottom: MyDoubleSize.double5), child: new Material(
        borderRadius: BorderRadius.all(Radius.circular(1000.0)),
        color: MyColors.color757c87,
        child: new InkWell(onTap: callback,
          child: Container(
            child: Center(
              child: Image.asset(
                'assets/images/equal.png', width: 25.0,),),),),),),);

  }

  String getShowNumber(double number) {
    if (number != double.infinity && number != double.negativeInfinity &&
        number != double.maxFinite && number != double.maxFinite) {
      return Decimal.parse(number.toString()).toString();
    }
    return number.toString();
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
      elevation: 0.0,
    );
  }

  addStatement({int operator, Decimal inputNumber}) {
    statements.add(statement);
    statement = Statement();
    statement.operator = operator;
    statement.inputNumber = inputNumber;
  }

  Builder clickToShowScaffold(Widget widget) {
    return new Builder(builder: (BuildContext context) {
      return GestureDetector(child: widget, onTap: () {
        Navigator.push(context, new PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return CategoryCalculatorScreen();
            },
            transitionsBuilder: (___, Animation<double> animation, ____,
                Widget child) {
              return new FadeTransition(
                opacity: animation,
                child: SizeTransition(child: child, sizeFactor: animation,),
              );
            }
        ));
      },);
    });
  }

}