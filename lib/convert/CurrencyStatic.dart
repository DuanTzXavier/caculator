import 'package:calculator/convert/CurrencyModel.dart';

class CurrencyStatic {
  static final cny = CurrencyModel(currencyName: "人民币", currency: "CNY");
  static final usd = CurrencyModel(currencyName: "美元", currency: "USD");
  static final hkd = CurrencyModel(currencyName: "港币", currency: "HKD");
  static final gbp = CurrencyModel(currencyName: "英镑", currency: "GBP");
  static final jpy = CurrencyModel(currencyName: "日元", currency: "JPY");
  static final eur = CurrencyModel(currencyName: "欧元", currency: "EUR");

  static final currencyList = List.from([cny, usd, hkd, gbp, jpy, eur]);
}