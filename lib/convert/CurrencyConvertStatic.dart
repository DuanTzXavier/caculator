import 'package:calculator/convert/CurrencyConvertModel.dart';
import 'package:calculator/convert/CurrencyStatic.dart';

class CurrencyConvertStatic{
  static final cny2usd = CurrencyConvertModel(fromCurrency: CurrencyStatic.cny, toCurrency: CurrencyStatic.usd, retio: "6.5");
  static final cny2jpy = CurrencyConvertModel(fromCurrency: CurrencyStatic.cny, toCurrency: CurrencyStatic.jpy, retio: "6.5");
  static final cny2hkd = CurrencyConvertModel(fromCurrency: CurrencyStatic.cny, toCurrency: CurrencyStatic.hkd, retio: "6.5");
  static final cny2gbp = CurrencyConvertModel(fromCurrency: CurrencyStatic.cny, toCurrency: CurrencyStatic.gbp, retio: "6.5");
  static final cny2cur = CurrencyConvertModel(fromCurrency: CurrencyStatic.cny, toCurrency: CurrencyStatic.eur, retio: "6.5");
  static final jpy2usd = CurrencyConvertModel(fromCurrency: CurrencyStatic.jpy, toCurrency: CurrencyStatic.cny, retio: "6.5");
//  static final cny2usd = CurrencyConvertModel(fromCurrency: CurrencyStatic.cny, toCurrency: CurrencyStatic.usd, retio: "6.5");
//  static final cny2usd = CurrencyConvertModel(fromCurrency: CurrencyStatic.cny, toCurrency: CurrencyStatic.usd, retio: "6.5");
//  static final cny2usd = CurrencyConvertModel(fromCurrency: CurrencyStatic.cny, toCurrency: CurrencyStatic.usd, retio: "6.5");

}