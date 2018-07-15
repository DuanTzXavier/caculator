import 'package:calculator/convert/CurrencyModel.dart';
import 'package:meta/meta.dart';

class CurrencyConvertModel{
  CurrencyModel fromCurrency;
  CurrencyModel toCurrency;
  String retio;
  String updateTime;

  CurrencyConvertModel({
    @required this.fromCurrency,
    @required this.toCurrency,
    @required this.retio,
  });

  setRetio(String retio){
    this.retio = retio;
  }
}