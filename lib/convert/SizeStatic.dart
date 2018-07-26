import 'package:calculator/convert/ConvertModel.dart';
import 'package:decimal/decimal.dart';

class SizeStatic {
  static final cubicMeter = ConvertModel(
      name: "立方米", absValue: Decimal.fromInt(1), key: "", unit: "m³");
  static final cubicDecimeter = ConvertModel(
      name: "立方分米", absValue: Decimal.parse("0.001"), key: "", unit: "dm³");
  static final cubicCentimeter = ConvertModel(
      name: "立方厘米", absValue: Decimal.parse("0.000001"), key: "", unit: "cm³");
  static final cubicMillimeter = ConvertModel(
      name: "立方毫米", absValue: Decimal.parse("0.000000001"), key: "", unit: "mm³");
  static final hectoliter = ConvertModel(
      name: "公石", absValue: Decimal.parse("0.01"), key: "", unit: "hl");
  static final litre = ConvertModel(
      name: "升", absValue: Decimal.parse("0.001"), key: "", unit: "l");
  static final decilitre = ConvertModel(
      name: "分升", absValue: Decimal.parse("0.0001"), key: "", unit: "dl");
  static final centilitre = ConvertModel(
      name: "厘升", absValue: Decimal.parse("0.00001"), key: "", unit: "cl");
  static final milliliter = ConvertModel(
      name: "毫升", absValue: Decimal.parse("0.000001"), key: "", unit: "ml");
  static final cubicFoot = ConvertModel(
      name: "立方英尺", absValue: Decimal.parse("0.0283168466"), key: "", unit: "ft³");
  static final cubicInch = ConvertModel(
      name: "立方英寸", absValue: Decimal.parse("0.000016387064"), key: "", unit: "in³");
  static final cubicYards = ConvertModel(
      name: "立方码", absValue: Decimal.parse("0.764554858"), key: "", unit: "yd³");
  static final acreFoot = ConvertModel(
      name: "亩英尺", absValue: Decimal.parse("1234"), key: "", unit: "af³");

  static List<ConvertModel> sizes = List.castFrom(
      [
        cubicMeter,
        cubicDecimeter,
        cubicCentimeter,
        cubicMillimeter,
        hectoliter,
        litre,
        decilitre,
        centilitre,
        milliliter,
        cubicFoot,
        cubicInch,
        cubicYards,
        acreFoot,
      ]);
}