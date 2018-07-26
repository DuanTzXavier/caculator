import 'package:calculator/convert/ConvertModel.dart';
import 'package:decimal/decimal.dart';

class AeraStatic {
  static final squareKilometre= ConvertModel(
      name: "平方千米", absValue: Decimal.fromInt(1000000), key: "", unit: "km²");
  static final hectare = ConvertModel(
      name: "公顷", absValue: Decimal.fromInt(10000), key: "", unit: "ha");
  static final acre = ConvertModel(
      name: "公亩", absValue: Decimal.fromInt(100), key: "", unit: "are");
  static final squareMeter = ConvertModel(
      name: "平方米", absValue: Decimal.fromInt(1), key: "", unit: "m²");
  static final squareDecimetre = ConvertModel(
      name: "平方分米", absValue: Decimal.parse("0.01"), key: "", unit: "dm²");
  static final squareCentimetre = ConvertModel(
      name: "平方厘米", absValue: Decimal.parse("0.0001"), key: "", unit: "cm²");
  static final squareMillimetre = ConvertModel(
      name: "平方毫米", absValue: Decimal.parse("0.000001"), key: "", unit: "mm²");
  static final squareMicrometre = ConvertModel(
      name: "平方微米", absValue: Decimal.parse("0.000000000001"), key: "", unit: "μm²");
  static final engAcre = ConvertModel(
      name: "英亩", absValue: Decimal.parse("4046.856"), key: "", unit: "acre");
  static final squareMile = ConvertModel(
      name: "平方英里", absValue: Decimal.parse("2589988.11"), key: "", unit: "mile²");
  static final squareYard = ConvertModel(
      name: "平方码", absValue: Decimal.parse("0.83612736"), key: "", unit: "yd²");
  static final squareFoot = ConvertModel(
      name: "平方英尺", absValue: Decimal.parse("0.09290304"), key: "", unit: "ft²");
  static final squareInch = ConvertModel(
      name: "平方英寸", absValue: Decimal.parse("0.00064516"), key: "", unit: "in²");
  static final sqrd = ConvertModel(
      name: "平方竿", absValue: Decimal.parse("25.2928526"), key: "", unit: "rd²");
  static final qing = ConvertModel(
      name: "顷", absValue: Decimal.parse("200000")/Decimal.fromInt(3), key: "", unit: "qing");
  static final mu = ConvertModel(
      name: "亩", absValue: Decimal.parse("2000")/Decimal.fromInt(3), key: "", unit: "mu");
  static final squareChi = ConvertModel(
      name: "平方尺", absValue: Decimal.parse("1")/Decimal.fromInt(9), key: "", unit: "chi²");
  static final squareCun = ConvertModel(
      name: "平方寸", absValue: Decimal.parse("0.01")/Decimal.fromInt(9), key: "", unit: "chun²");
  static final squareGongli = ConvertModel(
      name: "平方公里", absValue: Decimal.parse("1000000"), key: "", unit: "gongli²");

  static List<ConvertModel> aeras = List.castFrom([
    squareKilometre,
    hectare,
    acre,
    squareMeter,
    squareDecimetre,
    squareCentimetre,
    squareMillimetre,
    squareMicrometre,
    engAcre,
    squareMile,
    squareYard,
    squareFoot,
    squareInch,
    sqrd,
    qing,
    mu,
    squareChi,
    squareCun,
    squareGongli
  ]);
}