import 'package:calculator/convert/ConvertModel.dart';
import 'package:decimal/decimal.dart';

class SpeedStatic {
  static final lightSpeed = ConvertModel(
      name: "光速", absValue: Decimal.fromInt(333564095), key: "", unit: "c");
  static final mach = ConvertModel(
      name: "马赫", absValue: Decimal.parse("340.3"), key: "", unit: "Ma");
  static final meterPerSecond = ConvertModel(
      name: "米/秒", absValue: Decimal.fromInt(1), key: "", unit: "m/s");
  static final kilometerPerHour = ConvertModel(
      name: "千米/小时", absValue: Decimal.parse("3.6"), key: "", unit: "km/h");
  static final kilometerPerSecond = ConvertModel(
      name: "千米/秒", absValue: Decimal.parse("0.001"), key: "", unit: "km/s");
  static final seemilePerHour = ConvertModel(
      name: "海里/小时", absValue: Decimal.parse("1.94384449"), key: "", unit: "kn");
  static final milePerHour = ConvertModel(
      name: "英里/小时", absValue: Decimal.parse("2.23693629"), key: "", unit: "mph");
  static final footPerSecond = ConvertModel(
      name: "英寸/秒", absValue: Decimal.parse("39.3700787"), key: "", unit: "ips");
  static final inchPerSecond = ConvertModel(
      name: "英尺/秒", absValue: Decimal.parse("3.2808399"), key: "", unit: "fps");

  static List<ConvertModel> speeds = List.castFrom(
      [
        lightSpeed,
        mach,
        meterPerSecond,
        kilometerPerHour,
        kilometerPerSecond,
        seemilePerHour,
        milePerHour,
        footPerSecond,
        inchPerSecond,
      ]);
}