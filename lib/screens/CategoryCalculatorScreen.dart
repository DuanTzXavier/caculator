import 'package:calculator/screens/ConvertCalculatorScreen.dart';
import 'package:calculator/screens/ExchangeCalculatorScreen.dart';
import 'package:calculator/screens/SettingScreen.dart';
import 'package:calculator/static/MyColors.dart';
import 'package:calculator/static/MyStrings.dart';
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
                      'assets/images/category_calculator.png', name: MyStrings.category_calculator,
                      callback: () {
                        Navigator.pop(context);
                      }),
                  initIconButton(
                      'assets/images/category_length.png', name: MyStrings.category_lenth,
                      callback: () {
                        Navigator.push(context, new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return ConvertCalculatorScreen();
                            },
                            transitionsBuilder: (___,
                                Animation<double> animation,
                                ____,
                                Widget child) {
                              return new FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            }
                        ));
                      }),
                  initIconButton(
                      'assets/images/category_time.png', name: MyStrings.category_time,
                      callback: () {
                        Navigator.push(context, new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return ConvertCalculatorScreen();
                            },
                            transitionsBuilder: (___,
                                Animation<double> animation,
                                ____,
                                Widget child) {
                              return new FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            }
                        ));
                      }),
                ])),
            Expanded(child: Row(
                children: <Widget>[
                  initIconButton(
                      'assets/images/category_area.png', name: MyStrings.category_area,
                      callback: () {
                        Navigator.push(context, new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return ConvertCalculatorScreen();
                            },
                            transitionsBuilder: (___,
                                Animation<double> animation,
                                ____,
                                Widget child) {
                              return new FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            }
                        ));
                      }),
                  initIconButton(
                      'assets/images/category_temperature.png',
                      name: MyStrings.category_temperature, callback: () {
                    Navigator.push(context, new PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) {
                          return ConvertCalculatorScreen();
                        },
                        transitionsBuilder: (___, Animation<double> animation,
                            ____,
                            Widget child) {
                          return new FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        }
                    ));
                  }),
                  initIconButton(
                      'assets/images/category_speed.png', name: MyStrings.category_speed,
                      callback: () {
                        Navigator.push(context, new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return ConvertCalculatorScreen();
                            },
                            transitionsBuilder: (___,
                                Animation<double> animation,
                                ____,
                                Widget child) {
                              return new FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            }
                        ));
                      }),
                ])),
            Expanded(child: Row(
                children: <Widget>[
                  initIconButton(
                      'assets/images/category_weight.png', name: MyStrings.category_weight,
                      callback: () {
                        Navigator.push(context, new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return ConvertCalculatorScreen();
                            },
                            transitionsBuilder: (___,
                                Animation<double> animation,
                                ____,
                                Widget child) {
                              return new FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            }
                        ));
                      }),
                  initIconButton(
                      'assets/images/category_size.png', name: MyStrings.category_size,
                      callback: () {
                        Navigator.push(context, new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return ConvertCalculatorScreen();
                            },
                            transitionsBuilder: (___,
                                Animation<double> animation,
                                ____,
                                Widget child) {
                              return new FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            }
                        ));
                      }),
                  initIconButton(
                      'assets/images/category_exchange.png', name: MyStrings.category_exchange,
                      callback: () {
                        Navigator.push(context, new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return ExchangeCalculatorScreen();
                            },
                            transitionsBuilder: (___,
                                Animation<double> animation,
                                ____,
                                Widget child) {
                              return new FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            }
                        ));
                      }),
                ])),
            Expanded(child: Row(
                children: <Widget>[
//                  initIconButton(null),
//                  initIconButton(null),
//                  initIconButton(null),
                ])),
          ],
        ),),);
  }

  Widget initIconButton(String assetName,
      {GestureTapCallback callback, double size: 22.0, Color color: const Color(
          0xFF303030), String name: ""}) {
    return Expanded(
      child: new Material(
        color: MyColors.color757c87,
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
                  Padding(padding: EdgeInsets.all(5.0), child: Image.asset(assetName, width: 25.0,),),
                  Padding(padding: EdgeInsets.all(5.0),
                    child: Text(
                      "$name", style: TextStyle(color: Colors.white),),),
                ],),),),),),);
  }

  Widget initAppBar() {
    return AppBar(
      backgroundColor: MyColors.color757c87,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      leading: null,
      title: Text(MyStrings.category_title),
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