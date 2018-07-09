import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar(),
      body: Center(child: Text("123"),),);
  }

  Widget initAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[300],
      elevation: 0.0,
      title: Text("计算器"),
    );
  }

}