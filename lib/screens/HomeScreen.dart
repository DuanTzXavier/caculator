import 'package:caculator/utils/OperateUtil.dart';
import 'package:caculator/viewmodel/Statement.dart';
import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomeScreen();
}

class MyHomeScreen extends State<HomeScreen> {
  String showText = "0";
  String resultNumber = "0";
  List<Statement> statements = List();
  Statement statement = Statement();
  bool isShowResult = false;
  bool isAllClear = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar(),
      body: Column(
        children: <Widget>[
          initInputedView(),
          Expanded(
            child: Container(color: Colors.white, child: initButtons(),),)
        ],
      ),
    );
  }

  Widget initResult() {
    return Align(alignment: Alignment.bottomRight, child: Text(
      "=" + "$resultNumber",
      style: TextStyle(fontSize: 23.0, color: Colors.grey),),);
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
                opacity: isShowResult || isblock ? 0.0 : 1.0, child: initResult(),);
            } else
            if (position == 0 || (position == 1 && statements.length > 0)) {
              String operator = OperateUtil.getStatementOperator(
                  statement.operator);
              String showNumber = isShowResult ? statement.inputNumber
                  .toString() : showText;
              widget = Row(
                mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 20.0),
                  alignment: Alignment.bottomRight,
                  child: Text('$operator',
                    style: TextStyle(fontSize: 40.0),),),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text('$showNumber',
                    style: TextStyle(fontSize: 40.0),),),
              ],);
            } else {
              int index = statements.length + 1 - position;
              String number = statements[index].inputNumber.toString();
              String operator = OperateUtil.getStatementOperator(
                  statements[index].operator);
              widget =
                  Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Text('$operator',
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.grey[600]),),),
                        Align(
                          child: Text('$number',
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.grey[600]),),),

                      ],),

                    Offstage(offstage: statements[index].operator == 5 ? false : true, child: Divider(color: Colors.grey,),),
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
              initButton("AC", color: Colors.orange, callback: () {
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
              initButton("%", callback: () {
                appendNumber("%");
              }),
            ])),

        Expanded(child: Column(
            children: <Widget>[
              initButton("DEL", callback: () {
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
              initButton("/", callback: () {
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
              initButton("*", callback: () {
                addOperator(3);
              }),
              initButton("-", callback: () {
                addOperator(2);
              }),
              initButton("+", callback: () {
                addOperator(1);
              }),
              initBigButton("=", callback: () {
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
      if (statement.inputNumber == null) {
        statement.inputNumber = Decimal.fromInt(0);
      }
      if (!statements.contains(statement)) {
        statements.add(statement);
      }
      statement = Statement();
      statement.operator = operator;
      if (operator > 2) {
        statement.inputNumber = Decimal.fromInt(1);
      } else {
        statement.inputNumber = Decimal.fromInt(0);
      }
      showText = "";
      calculateResult();
    });
  }

  void calculateResult() {
    setState(() {
      if (statements.length > 0 && statements[statements.length - 1].operator == 5){
        return;
      }

      Decimal result = Decimal.fromInt(0);
      try {
        for (var statement in statements) {
          result = OperateUtil.calculateStatement(result, statement);
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
      statements.add(statement);
      statement = Statement();
      statement.inputNumber = Decimal.parse(resultNumber);
      statement.operator = 5;
      isShowResult = true;
    });
  }

  void initCalculateValue() {
    isShowResult = false;
    showText = "0";
    statement = Statement();

    if (isAllClear){
      statements.clear();
    }else{
      isAllClear = true;
      for (int i = statements.length;i > 0;i --){
        if (statements[i-1].operator != 5){
          statements.remove(statements[i-1]);
        }else{
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

  Widget initButton(String text, {GestureTapCallback callback, Color color}) {
    return Expanded(
      child: new Material(
        child: new InkWell(onTap: callback,
          child: Container(
            decoration: new BoxDecoration(
              border: new Border.all(
                  width: 0.1,
                  color: Colors.black38),),
            child: Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 22.0, color: color),),),),),),);
  }

  Widget initIconButton(String text, GestureTapCallback callback) {
    return Expanded(
        child: Container(
          decoration: new BoxDecoration(
            border: new Border.all(
                width: 0.5,
                color: Colors.black38),),
          child: GestureDetector(onTap: () {}, child: Center(
            child: Icon(Icons.add),),),));
  }

  Widget initBigButton(String text, {GestureTapCallback callback}) {
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
              child: Text(text,
                style: TextStyle(
                    fontSize: 40.0, color: Colors.white),),),),),),);
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
          padding: EdgeInsets.only(right: 15.0), child: clickToShowScaffold(
            Icon(Icons.swap_horiz, color: Colors.grey[800]), "点什么点，我还没写功能呢"),)
      ],
    );
  }

  Builder clickToShowScaffold(Widget widget, String message) {
    return new Builder(builder: (BuildContext context) {
      return GestureDetector(child: widget, onTap: () {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(message),
        ));
      },);
    });
  }

}