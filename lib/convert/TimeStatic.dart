import 'package:calculator/convert/ConvertModel.dart';
import 'package:decimal/decimal.dart';

class TimeStatic {
  static final year = ConvertModel(
      name: "年",
      absValue: Decimal.fromInt(365) * Decimal.fromInt(24) *
          Decimal.fromInt(60) * Decimal.fromInt(60),
      key: "",
      unit: "yr");
  static final week = ConvertModel(
      name: "周", absValue: Decimal.fromInt(7) * Decimal.fromInt(24) *
      Decimal.fromInt(60) * Decimal.fromInt(60), key: "", unit: "wk");
  static final day = ConvertModel(
      name: "天", absValue: Decimal.fromInt(24) *
      Decimal.fromInt(60) * Decimal.fromInt(60), key: "", unit: "day");
  static final hour = ConvertModel(
      name: "小时",
      absValue: Decimal.fromInt(60) * Decimal.fromInt(60),
      key: "",
      unit: "h");
  static final min = ConvertModel(
      name: "分钟", absValue: Decimal.fromInt(60), key: "", unit: "min");
  static final second = ConvertModel(
      name: "秒", absValue: Decimal.fromInt(1), key: "", unit: "s");
  static final milliscond = ConvertModel(
      name: "微秒", absValue: Decimal.parse("0.001"), key: "", unit: "ms");
  static final micronscond = ConvertModel(
      name: "纳秒", absValue: Decimal.parse("0.000001"), key: "", unit: "μs");
  static final picoscond = ConvertModel(
      name: "皮秒", absValue: Decimal.parse("0.000000001"), key: "", unit: "ps");

  static List<ConvertModel> times = List.castFrom(
      [
        year,
        week,
        day,
        hour,
        min,
        second,
        milliscond,
        micronscond,
        picoscond,
      ]);
}