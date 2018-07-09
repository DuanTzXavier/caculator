import 'package:flutter/material.dart';

class ConvertCalculatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ConvertCalculatorScreenState();
}

class ConvertCalculatorScreenState extends State<ConvertCalculatorScreen> {

  String editText = "1";
  String firstShowText = "1";
  String secondShowText = "2";
  bool isEditFirst = true;

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
        Expanded(child: Container(
          child: Row(
            children: <Widget>[
              Container(
                child: Container(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Row(children: <Widget>[
                    Text("米",
                      style: TextStyle(
                          fontSize: 24.0, color: Colors.grey[800]),),
                    Icon(Icons.arrow_drop_down, color: Colors.grey,),
                  ],),),),
              Expanded(
                child: GestureDetector(onTap: () {
                  setEditNumber(true);
                }, child: Padding(padding: EdgeInsets.only(right: 25.0),
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
                            child: Text("m",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[800]),),),
                        ],),
                    ],),),)
                ,),
            ],),),),
        Divider(
          height: 0.5,
        ),
        Expanded(child: Container(
          child: Row(
            children: <Widget>[
              Container(
                child: Container(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Row(children: <Widget>[
                    Text("厘米",
                      style: TextStyle(
                          fontSize: 24.0, color: Colors.grey[800]),),
                    Icon(Icons.arrow_drop_down, color: Colors.grey,),
                  ],),),),
              Expanded(
                child: GestureDetector(onTap: () {
                  setEditNumber(false);
                }, child: Padding(padding: EdgeInsets.only(right: 25.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("$secondShowText",
                            style: TextStyle(
                                fontSize: 28.0,
                                color: isEditFirst ? Colors.grey[800] : Colors
                                    .orange),),
                        ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 2.0),
                            child: Text("cm",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[800]),),),
                        ],),
                    ],),),)
                ,),
            ],),)),
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
                        initButton("8", callback: () {}),
                        initButton("9", callback: () {}),
                      ])),
                  Expanded(child: Row(
                      children: <Widget>[
                        initButton("4", callback: () {}),
                        initButton("5", callback: () {}),
                        initButton("6", callback: () {}),
                      ])),
                  Expanded(child: Row(
                      children: <Widget>[
                        initButton("1", callback: () {}),
                        initButton("2", callback: () {}),
                        initButton("3", callback: () {}),
                      ])),

                  Expanded(child: Row(
                      children: <Widget>[
                        initBig0TextButton("0", callback: () {}),
                        initButton(".", callback: () {}),
                      ])),
                ])),

        Expanded(
            child: Column(
                children: <Widget>[
                  initBigTextButton("AC", callback: () {}),
                  initBigButton(Icons.backspace, callback: () {}),
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

  void appendNumber(String number) {
    setState(() {
      if (isEditFirst) {
        firstShowText += number;
      } else {
        secondShowText += number;
      }
    });
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

}