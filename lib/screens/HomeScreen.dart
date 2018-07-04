import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomeScreen();
}

class MyHomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          initInputedView(),
          Expanded(child: initButtons(),)
        ],
      ),
    );
  }

  Widget initInputedView() {
    return AspectRatio(
      aspectRatio: 5 / 4,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text("123",
            style: TextStyle(fontSize: 40.0),),),),);
  }

  Widget initButtons() {
    return Row(
      children: <Widget>[
        Expanded(child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              initButton("AC"),
              initButton("7"),
              initButton("4"),
              initButton("1"),
              initButton("%"),
            ])),

        Expanded(child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              initButton("DEL"),
              initButton("8"),
              initButton("5"),
              initButton("2"),
              initButton("0"),
            ])),

        Expanded(child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              initButton("/"),
              initButton("9"),
              initButton("6"),
              initButton("3"),
              initButton("."),
            ])),

        Expanded(child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              initButton("*"),
              initButton("-"),
              initButton("+", callback: () {}),
              initBigButton("="),
            ])),

      ],);
  }

  Widget initButton(String text, {GestureTapCallback callback}) {
    return Expanded(
        child: Container(
          decoration: new BoxDecoration(
            border: new Border.all(
                width: 0.15,
                color: Colors.black38),),
          child: GestureDetector(onTap: callback, child: Center(
            child: Text(text, style: TextStyle(fontSize: 20.0),),),),));
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
                  width: 0.15, color: Colors.black38),),
            child: Center(

              child: Text(text,
                style: TextStyle(fontSize: 30.0, color: Colors.white),),)));
  }

}