import 'package:meta/meta.dart';

class CurrencyModel{
  String currencyName;
  String currency;
  String absValue;

  CurrencyModel({
    @required this.currency,
    @required this.currencyName,
    @required this.absValue,
  });
}