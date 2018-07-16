import 'package:calculator/convert/CurrencyModel.dart';

class CurrencyStatic {
  static final cny = CurrencyModel(
      currencyName: "人民币", currency: "CNY", absValue: "1");
  static final usd = CurrencyModel(
      currencyName: "美元", currency: "USD", absValue: "0.1499");
  static final hkd = CurrencyModel(
      currencyName: "港币", currency: "HKD", absValue: "0.8501");
  static final gbp = CurrencyModel(
      currencyName: "英镑", currency: "GBP", absValue: "0.1129");
  static final jpy = CurrencyModel(
      currencyName: "日元", currency: "JPY", absValue: "16.845");
  static final eur = CurrencyModel(
      currencyName: "欧元", currency: "EUR", absValue: "0.1281");
  static final krw = CurrencyModel(
      currencyName: "韩元", currency: "KRW", absValue: "168.6421");
  static final thb = CurrencyModel(
      currencyName: "泰币", currency: "THB", absValue: "4.985");
  static final twd = CurrencyModel(
      currencyName: "新台币", currency: "TWD", absValue: "4.5742");
  static final vnd = CurrencyModel(
      currencyName: "越南盾", currency: "VND", absValue: "3454.7362");
  static final ars = CurrencyModel(
      currencyName: "阿根廷比索", currency: "ARS", absValue: "4.0758");
  static final aed = CurrencyModel(
      currencyName: "阿联酋迪拉姆", currency: "AED", absValue: "0.5504");
  static final aud = CurrencyModel(
      currencyName: "澳大利亚元", currency: "AUD", absValue: "0.2015");
  static final mop = CurrencyModel(
      currencyName: "澳门元", currency: "MOP", absValue: "1.2067");
  static final brl = CurrencyModel(
      currencyName: "巴西雷亚尔", currency: "BRL", absValue: "0.577");
  static final isk = CurrencyModel(
      currencyName: "冰岛克朗", currency: "ISK", absValue: "16.0083");
  static final pln = CurrencyModel(
      currencyName: "波兰兹罗提", currency: "PLN", absValue: "0.551");
  static final dkk = CurrencyModel(
      currencyName: "丹麦克朗", currency: "DKK", absValue: "0.9543");
  static final rub = CurrencyModel(
      currencyName: "俄罗斯卢布", currency: "RUB", absValue: "9.3212");
  static final cad = CurrencyModel(
      currencyName: "加拿大元", currency: "CAD", absValue: "0.1969");
  static final cnh = CurrencyModel(
      currencyName: "离岸人民币", currency: "CNH", absValue: "1.0021");
  static final myr = CurrencyModel(
      currencyName: "马来西亚林吉特", currency: "MYR", absValue: "0.6054");
  static final mmk = CurrencyModel(
      currencyName: "缅甸元", currency: "MMK", absValue: "213.1039");
  static final php = CurrencyModel(
      currencyName: "菲律宾元", currency: "PHP", absValue: "8.0105");

  static final currencyList = List.from([
    cny,
    usd,
    hkd,
    gbp,
    jpy,
    eur,
    krw,
    thb,
    vnd,
    ars,
    aed,
    aud,
    mop,
    brl,
    isk,
    pln,
    dkk,
    rub,
    cad,
    cnh,
    myr,
    mmk,
    php
  ]);
}