import 'package:flutter/material.dart';

class UIUtil{
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}