import 'package:calculator/static/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar(),
      backgroundColor: MyColors.colorf9f9f9,
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(top: 9.0, left: 15.0, bottom: 9.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("当前版本", style: TextStyle(
                    color: MyColors.color333333, fontSize: 14.0),),
                Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text("version : 1.1.0", style: TextStyle(
                      color: MyColors.color999999, fontSize: 12.0),),
                )
              ],),),

          Builder(builder: (BuildContext context) {
            return clickToShowScaffold(Container(
              margin: EdgeInsets.only(top: 8.0),
              padding: EdgeInsets.only(top: 9.0, left: 15.0, bottom: 9.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("问题反馈", style: TextStyle(
                      color: MyColors.color333333, fontSize: 14.0),),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text("微信号 : duatz_theone", style: TextStyle(
                        color: MyColors.color999999, fontSize: 12.0),),
                  )
                ],),), callback: () {
              Clipboard.setData(new ClipboardData(text: "duatz_theone"));
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text('微信号 duatz_theone 已复制！'),
                action: new SnackBarAction(
                    label: '知道了',
                    onPressed: () {
                      // do something to undo
                    }
                ),
              ));
            });
          }),

        ],
      ),);
  }

  Widget initAppBar() {
    return AppBar(
      backgroundColor: MyColors.colorfefefe,
      elevation: 0.0,
      title: Text("设置", style: TextStyle(color: MyColors.color333333),),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: clickToShowScaffold(
          Icon(Icons.chevron_left, size: 30.0, color: MyColors.color333333,)),
    );
  }

  Builder clickToShowScaffold(Widget widget, {GestureTapCallback callback}) {
    return new Builder(builder: (BuildContext context) {
      return GestureDetector(child: widget, onTap: callback == null ? () {
        Navigator.pop(context);
      } : callback,);
    });
  }

}