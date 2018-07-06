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
        padding: EdgeInsets.only(right: 20.0),
        child: ListView.builder(
          reverse: true,
          itemCount: statements.length == 0 ? 1 : statements.length + 2,
          itemBuilder: (BuildContext context, int position) {
            Widget widget;

            if (position == 0 && statements.length > 0) {
              widget = initResult();
            } else
            if (position == 0 || (position == 1 && statements.length > 0)) {
              String operator = getStatementOperator(statement.operator);
              widget = Row(
                mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 20.0),
                  alignment: Alignment.bottomRight,
                  child: Text('$operator',
                    style: TextStyle(fontSize: 40.0),),),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text('$showText',
                    style: TextStyle(fontSize: 40.0),),),
              ],);
            } else {
              int index = statements.length + 1 - position;
              String number = getShowNumber(statements[index].number);
              String operator = getStatementOperator(
                  statements[index].operator);
              widget = Row(
                mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text('$operator',
                    style: TextStyle(
                        fontSize: 30.0, color: Colors.grey[600]),),),
                Align(
                  child: Text('$number',
                    style: TextStyle(
                        fontSize: 30.0, color: Colors.grey[600]),),),

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
              initBigButton("="),
            ])),

      ],);
  }

  void appendNumber(String append) {
    setState(() {
      if (append == "%"){
        showText = getShowNumber(double.parse(showText)/100);
      }else if (showText == "0" || statement.number == 0) {
        this.showText = append;
      } else {
        this.showText += append;
      }
      statement.number = double.parse(showText);
      caculateResult();
    });
  }

  void clearNumber() {
    setState(() {
      this.showText = "0";
      statements.clear();
      statement = Statement();
    });
  }

  void addOperator(int operator) {
    setState(() {
      if (statement.number == 0.0) {
        statement.operator = operator;
        return;
      }
      if (!statements.contains(statement)) {
        statements.add(statement);
      }
      statement = Statement();
      statement.operator = operator;
      if (operator > 2) {
        statement.number = 1.0;
      } else {
        statement.number = 0.0;
      }
      showText = " ";
      caculateResult();
    });
  }

  void caculateResult() {
    setState(() {
      double result = 0.0;
      for (var statement in statements) {
        result = caculateStatement(result, statement);
      }
      result = caculateStatement(result, statement);
      resultNumber = getShowNumber(result);
    });
  }

  double caculateStatement(double result, Statement statement) {
    switch (statement.operator) {
      case 1:
        result += statement.number;
        break;
      case 2:
        result -= statement.number;
        break;
      case 3:
        result *= statement.number;
        break;
      case 4:
        result /= statement.number;
        break;
      default:
        result = statement.number;
        break;
    }
    return result;
  }

  String getStatementOperator(int operator) {
    String result = " ";
    switch (operator) {
      case 1:
        result = "+";
        break;
      case 2:
        result = "-";
        break;
      case 3:
        result = "*";
        break;
      case 4:
        result = "/";
        break;
      default:
        result = " ";
        break;
    }
    return result;
  }

  void deleteNumber() {
    setState(() {
      if (showText.length < 2) {
        showText = statement.operator == 0 ? "0" : "";
      } else {
        showText = showText.substring(0, showText.length - 1);
      }
      if (showText.length < 2){
        statement.number = statement.operator > 2 ? 1.0 : 0.0;
      }else{
        statement.number = double.parse(showText);
      }
      caclulateStatement();
    });
  }

  void caclulateStatement() {
    caculateResult();
  }

  Widget initButton(String text, {GestureTapCallback callback, Color color}) {
    return Expanded(
        child: new Material(
          child: new InkWell(onTap: callback,
            child: GestureDetector(onTap: null, child: Container(
              decoration: new BoxDecoration(
                border: new Border.all(
                    width: 0.1,
                    color: Colors.black38),),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 22.0, color: color),),),),),),));
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

  Widget initBigButton(String text) {
    return Expanded(
        flex: 2,
        child: Container(
            decoration: new BoxDecoration(
              color: Colors.orange,
              border: new Border.all(
                  width: 0.1, color: Colors.black38),),
            child: Center(
              child: Text(text,
                style: TextStyle(fontSize: 40.0, color: Colors.white),),)));
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
          Icon(Icons.view_module, color: Colors.grey[800]), "view_module"),
      elevation: 0.0,
      actions: <Widget>[
        Container(padding: EdgeInsets.only(right: 15.0),child: clickToShowScaffold(
            Icon(Icons.swap_horiz, color: Colors.grey[800]), "swap_horiz"),)
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