import 'package:calculator/convert/ConvertModel.dart';
import 'package:decimal/decimal.dart';

class WeightStatic {
  static final ton = ConvertModel(
      name: "吨", absValue: Decimal.fromInt(1000000), key: "", unit: "t");
  static final kilogram = ConvertModel(
      name: "千克", absValue: Decimal.fromInt(1000), key: "", unit: "kg");
  static final gram = ConvertModel(
      name: "克", absValue: Decimal.fromInt(1), key: "", unit: "g");
  static final milligram = ConvertModel(
      name: "毫克", absValue: Decimal.parse("0.001"), key: "", unit: "mg");
  static final microgram = ConvertModel(
      name: "微克", absValue: Decimal.parse("0.000001"), key: "", unit: "μg");
  static final quintal = ConvertModel(
      name: "公担", absValue: Decimal.fromInt(100000), key: "", unit: "q");
  static final pound = ConvertModel(
      name: "磅", absValue: Decimal.parse("453.59237"), key: "", unit: "lb");
  static final ounce = ConvertModel(
      name: "盎司", absValue: Decimal.parse("28.3495231"), key: "", unit: "oz");
  static final carat = ConvertModel(
      name: "克拉", absValue: Decimal.parse("0.2"), key: "", unit: "ct");
  static final grains = ConvertModel(
      name: "格令", absValue: Decimal.parse("0.06479891"), key: "", unit: "gr");
  static final longTon = ConvertModel(
      name: "长吨", absValue: Decimal.parse("1016046.91"), key: "", unit: "l.t");
  static final shortTon = ConvertModel(
      name: "短吨", absValue: Decimal.parse("907184.74"), key: "", unit: "sh.t");
  static final enCWT = ConvertModel(
      name: "英担", absValue: Decimal.parse("50802.3454"), key: "", unit: "cwt");
  static final usCWT = ConvertModel(
      name: "美担", absValue: Decimal.parse("45359.237"), key: "", unit: "cwt");
  static final enStone = ConvertModel(
      name: "英石", absValue: Decimal.parse("6350.29318"), key: "", unit: "uk.st");
  static final dram = ConvertModel(
      name: "打兰", absValue: Decimal.parse("1.7718452"), key: "", unit: "dr");
  static final dan = ConvertModel(
      name: "担", absValue: Decimal.fromInt(50000), key: "", unit: "dan");
  static final jin = ConvertModel(
      name: "斤", absValue: Decimal.fromInt(500), key: "", unit: "jin");
  static final liang = ConvertModel(
      name: "两", absValue: Decimal.fromInt(50), key: "", unit: "liang");
  static final qian = ConvertModel(
      name: "钱", absValue: Decimal.fromInt(5), key: "", unit: "qian");
  static final jinTW = ConvertModel(
      name: "斤(台湾)", absValue: Decimal.fromInt(600), key: "", unit: "jin(tw)");

  static List<ConvertModel> weights = List.castFrom([
    ton,
    kilogram,
    gram,
    milligram,
    microgram,
    quintal,
    pound,
    ounce,
    carat,
    grains,
    longTon,
    shortTon,
    enCWT,
    usCWT,
    enStone,
    dram,
    dan,
    jin,
    liang,
    qian,
    jinTW
  ]);
}