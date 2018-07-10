import 'package:meta/meta.dart';

class ConvertModel {
  String key;
  String name;
  String unit = "㎡";
  String absValue;

  ConvertModel({
    @required this.key,
    @required this.name,
    @required this.unit,
    @required this.absValue,
  });

}