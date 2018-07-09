import 'package:calculator/screens/CategaryCalcuatorScreen.dart';
import 'package:calculator/screens/HomeScreen.dart';
import 'package:calculator/utils/OperateUtil.dart';
import 'package:calculator/viewmodel/Statement.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CalculatorPage extends State<HomeScreen> {
  String showText = "0";
  String resultNumber = "0";
  List<Statement> statements = List();
  Statement statement = Statement();
  bool isShowResult = false;
  bool isAllClear = true;

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
            color: Colors.grey,),),
        Text('$resultNumber',
          style: TextStyle(
              fontSize: 25.0, color: Colors.grey),),
      ],),);
  }

  Widget initInputedView() {
    return AspectRatio(
      aspectRatio: 6 / 4,
      child: Container(color: Colors.grey[100],
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
              String showNumber = isShowResult ? statement.inputNumber
                  .toString() : showText;
              widget = Row(
                mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(operatorIcon, size: 40.0,),),
                Text('$showNumber',
                  style: TextStyle(fontSize: 50.0),),
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
                          child: Icon(operatorIcon, size: 20.0,
                            color: Colors.grey[600],),),
                        Text('$number',
                          style: TextStyle(
                              fontSize: 25.0, color: Colors.grey[600]),),
                      ],),

                    Offstage(
                      offstage: statements[index].operator == 5 ? false : true,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Divider(color: Colors.grey,),),),
                  ],);
            }

            return widget;
          },),),);
  }

  Widget initButtons() {
    return Row(
      children: <Widget>[
        Expanded(child: Column(
            children: <Widget>[
              initButton(
                  isAllClear ? "AC" : "C", color: Colors.orange, callback: () {
                clearNumber();
              }),
              initButton("7", callback: () {
                appendNumber("7");
              }),
              initButton("4", callback: () {
                appendNumber("4");
              }),
              initButton("1", callback: () {
                appendNumber("1");
              }),
              initIconButton(MdiIcons.percent, size: 24.0, callback: () {
                appendNumber("%");
              }),
            ])),

        Expanded(child: Column(
            children: <Widget>[
              initIconButton(Icons.backspace, callback: () {
                deleteNumber();
              }),
              initButton("8", callback: () {
                appendNumber("8");
              }),
              initButton("5", callback: () {
                appendNumber("5");
              }),
              initButton("2", callback: () {
                appendNumber("2");
              }),
              initButton("0", callback: () {
                appendNumber("0");
              }),
            ])),

        Expanded(child: Column(
            children: <Widget>[
              initIconButton(MdiIcons.division, size: 32.0, callback: () {
                addOperator(4);
              }),
              initButton("9", callback: () {
                appendNumber("9");
              }),
              initButton("6", callback: () {
                appendNumber("6");
              }),
              initButton("3", callback: () {
                appendNumber("3");
              }),
              initButton(".", callback: () {
                appendNumber(".");
              }),
            ])),

        Expanded(child: Column(
            children: <Widget>[
              initIconButton(Icons.clear, size: 28.0, callback: () {
                addOperator(3);
              }),
              initIconButton(Icons.remove, size: 28.0, callback: () {
                addOperator(2);
              }),
              initIconButton(Icons.add, size: 28.0, callback: () {
                addOperator(1);
              }),
              initBigButton(MdiIcons.equal, callback: () {
                showResult();
              }),
            ])),

      ],);
  }

  void appendNumber(String append) {
    setState(() {
      if (statement.operator == 5) {
        statements.add(statement);
        statement = Statement();
        showText = "0";
        isShowResult = false;
      }
      isAllClear = false;

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
        statements.add(statement);
        Decimal lastResult = statement.inputNumber;
        statement = new Statement();
        statement.inputNumber = lastResult;
        isShowResult = false;
      }
      if (statement.inputNumber == null && (statements.length == 0 ||
          (statements.length > 0 &&
              statements[statements.length - 1].operator == 5))) {
        statement.inputNumber = Decimal.fromInt(0);
      }
      if (!statements.contains(statement) && statement.inputNumber != null) {
        statements.add(statement);
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
//          print("status" + statements[i].operator.toString() + "x" + i.toString() + "   " + statements[i].inputNumber.toString());
          result = OperateUtil.calculateStatement(result, statements[i]);
        }
//        print("result pre" + statement.operator.toString() + " x  " + result.toString() + "   " + statement.inputNumber.toString());
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
        statements.add(statement);
        statement = Statement();
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

  Widget initBigButton(IconData icon, {GestureTapCallback callback}) {
    return Expanded(
      flex: 2,
      child: new Material(
        color: Colors.orange,
        child: new InkWell(onTap: callback,
          child: Container(
            decoration: new BoxDecoration(
              border: new Border.all(
                  width: 0.1, color: Colors.black38),),
            child: Center(
              child: Icon(icon,
                size: 35.0, color: Colors.white,),),),),),);
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
      backgroundColor: Colors.grey[100],
      leading: clickToShowScaffold(
          Icon(Icons.view_module, color: Colors.grey[800]), "点什么点，我还没写功能呢"),
      elevation: 0.0,
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 15.0), child:
        clickToShowScaffold(
            Icon(Icons.swap_horiz, color: Colors.grey[800]), "点什么点，我还没写功能呢")
          ,)
      ],
    );
  }

  Builder clickToShowScaffold(Widget widget, String message) {
    return new Builder(builder: (BuildContext context) {
      return GestureDetector(child: widget, onTap: () {

//        Navigator.push(context, new MaterialPageRoute<void>(
//            builder: (BuildContext context) {
//          return new Scaffold(
//            appBar: new AppBar(title: new Text('My Page')),
//            body: new Center(
//              child: new FlatButton(
//                child: new Text('POP'),
//                onPressed: () {
//                  Navigator.pop(context);
//                },
//              ),
//            ),
//          );
//        },
//        ));

//        var router = MaterialApp().onGenerateRoute;
//        Navigato
//        Navigator.push(context, new MaterialPageRoute<void>(
//        builder: (_) => CategrayCalculatorScreen()));
//        Scaffold.of(context).showSnackBar(new SnackBar(
//          content: new Text(message),
//        ));


        Navigator.push(context, new PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return CategrayCalculatorScreen();
            },
            transitionsBuilder: (___, Animation<double> animation, ____, Widget child) {
              return new FadeTransition(
                opacity: animation,
                child: SizeTransition(child: child, sizeFactor: Tween().animate(CurvedAnimation(parent: null, curve: null)),),

              );
            }
        ));
      },);
    });
  }

}