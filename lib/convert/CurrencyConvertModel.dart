import 'package:calculator/convert/CurrencyModel.dart';
import 'package:decimal/decimal.dart';
import 'package:meta/meta.dart';

class CurrencyConvertModel {
  CurrencyModel fromCurrency;
  CurrencyModel toCurrency;
  String retio;
  String updateTime;

  CurrencyConvertModel({
    @required this.fromCurrency,
    @required this.toCurrency,
  }) {
    this.retio = (Decimal.parse(toCurrency.absValue) /
        Decimal.parse(fromCurrency.absValue)).toString();
  }

  setRetio(String retio) {
    this.retio = retio;
  }
}