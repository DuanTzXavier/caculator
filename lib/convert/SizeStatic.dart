import 'package:calculator/convert/ConvertModel.dart';
import 'package:decimal/decimal.dart';

class SizeStatic {
  static final meter = ConvertModel(
      name: "米", absValue: Decimal.fromInt(1), key: "", unit: "m");
}