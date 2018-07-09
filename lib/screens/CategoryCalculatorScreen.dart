import 'package:calculator/screens/SettingScreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CategoryCalculatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CategoryCalculatorScreenState();
}

class CategoryCalculatorScreenState extends State<CategoryCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(child: Row(
                children: <Widget>[
                  initIconButton(
                      MdiIcons.calculator, name: "计算器", callback: () {
                    Navigator.pop(context);
                  }),
                  initIconButton(null),
                  initIconButton(null),
                ])),
            Expanded(child: Row(
                children: <Widget>[
                  initIconButton(null),
                  initIconButton(null),
                  initIconButton(null),
                ])),
            Expanded(child: Row(
                children: <Widget>[
                  initIconButton(null),
                  initIconButton(null),
                  initIconButton(null),
                ])),
          ],
        ),),);
  }

  Widget initIconButton(IconData icon,
      {GestureTapCallback callback, double size: 22.0, Color color: const Color(
          0xFF303030), String name: ""}) {
    return Expanded(
      child: new Material(
        color: Colors.brown[400],
        child: new InkWell(onTap: callback,
          child: Container(
            decoration: new BoxDecoration(
              border: new Border.all(
                  width: 0.2,
                  color: Colors.grey[400]),),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(5.0), child: Icon(
                    icon,
                    size: size, color: Colors.white,),),
                  Padding(padding: EdgeInsets.all(5.0), child: Text("$name", style: TextStyle(color: Colors.white),),),
                ],),),),),),);
  }

  Widget initAppBar() {
    return AppBar(
      backgroundColor: Colors.brown[400],
      automaticallyImplyLeading: false,
      elevation: 0.0,
      leading: null,
      title: Text("计算与换算"),
      centerTitle: true,
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 15.0), child:
        clickToShowScaffold(
            Icon(Icons.settings, color: Colors.white))
          ,)
      ],
    );
  }

  Builder clickToShowScaffold(Widget widget) {
    return new Builder(builder: (BuildContext context) {
      return GestureDetector(child: widget, onTap: () {
        Navigator.push(context, new PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return SettingScreen();
            },
            transitionsBuilder: (___, Animation<double> animation, ____,
                Widget child) {
              return new FadeTransition(
                opacity: animation,
                child: child,
              );
            }
        ));
      },);
    });
  }

}