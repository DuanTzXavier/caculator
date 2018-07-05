import 'package:caculator/viewmodel/Statement.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomeScreen();
}

class MyHomeScreen extends State<HomeScreen> {
  String showText = "0";
  List<Statement> statements = List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          initInputedView(),

          Expanded(child: Container(color: Colors.white, child: initButtons(),),)
        ],
      ),
    );
  }

  Widget initInputedView() {
    return AspectRatio(
      aspectRatio: 6 / 4,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(reverse: true, children: <Widget>[Align(
          alignment: Alignment.topRight,
          child: Text('$showText',
            style: TextStyle(fontSize: 40.0),),)],),),);
  }

  Widget initButtons() {
    return Row(
      children: <Widget>[
        Expanded(child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              initButton("AC", color: Colors.orange, callback: (){clearNumber();}),
              initButton("7", callback: () {appendNumber("7");}),
              initButton("4", callback: () {appendNumber("4");}),
              initButton("1", callback: () {appendNumber("1");}),
              initButton("%", callback: () {appendNumber("%");}),
            ])),

        Expanded(child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              initButton("DEL", callback: () {deleteNumber();}),
              initButton("8", callback: () {appendNumber("8");}),
              initButton("5", callback: () {appendNumber("5");}),
              initButton("2", callback: () {appendNumber("2");}),
              initButton("0", callback: () {appendNumber("0");}),
            ])),

        Expanded(child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              initButton("/", callback: () {appendNumber("/");}),
              initButton("9", callback: () {appendNumber("9");}),
              initButton("6", callback: () {appendNumber("6");}),
              initButton("3", callback: () {appendNumber("3");}),
              initButton(".", callback: () {appendNumber(".");}),
            ])),

        Expanded(child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              initButton("*", callback: () {appendNumber("*");}),
              initButton("-", callback: () {appendNumber("-");}),
              initButton("+", callback: () {appendNumber("+");}),
              initBigButton("="),
            ])),

      ],);
  }

  void appendNumber(String append){
    setState(() {
      if(showText == "0"){
        this.showText = append;
      }else{
        this.showText += append;
      }
    });
  }

  void clearNumber(){
    setState(() {
      this.showText = "0";
    });
  }

  void addOperator(){
    setState(() {

    });
  }

  void deleteNumber(){
    setState(() {
      if(showText.length <= 1){
        showText = "0";
      }else{
        showText = showText.substring(0, showText.length - 1);
      }
    });
  }

  void caclulateStatement(){

  }

  Widget initButton(String text, {GestureTapCallback callback, Color color}) {
    return Expanded(
        child: GestureDetector(onTap: callback, child: Container(
          decoration: new BoxDecoration(
            border: new Border.all(
                width: 0.1,
                color: Colors.black38),),
          child: Center(
            child: Text(text, style: TextStyle(fontSize: 22.0, color: color),),),),));
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

}