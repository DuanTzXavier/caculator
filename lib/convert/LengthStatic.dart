import 'package:calculator/convert/ConvertModel.dart';
import 'package:decimal/decimal.dart';

class LengthStatic {
  static final meter = ConvertModel(name: "米", absValue: "1", key: "", unit: "km");
  static final kilometer = ConvertModel(name: "千米", absValue: "1000", key: "", unit: "m");
  static final decimeter = ConvertModel(name: "分米", absValue: "0.1", key: "", unit: "dm");
  static final centimeter = ConvertModel(name: "厘米", absValue: "0.01", key: "", unit: "cm");
  static final millimeter = ConvertModel(name: "毫米", absValue: "0.001", key: "", unit: "mm");
  static final micron = ConvertModel(name: "微米", absValue: "0.000001", key: "", unit: "μ");
  static final nanometer = ConvertModel(name: "纳米", absValue: "0.000000001", key: "", unit: "nm");
  static final picometer = ConvertModel(name: "皮米", absValue: "0.000000000001", key: "", unit: "pm");
  static final seemile = ConvertModel(name: "海里", absValue: "1852", key: "", unit: "nmi");
  static final mile = ConvertModel(name: "英里", absValue: "1609.344", key: "", unit: "mi");
  static final furlong = ConvertModel(name: "弗隆", absValue: "201.168", key: "", unit: "fur");
  static final fathom = ConvertModel(name: "英寻", absValue: "1.8288", key: "", unit: "fm");
  static final yard = ConvertModel(name: "码", absValue: "0.9144", key: "", unit: "yd");
  static final feet = ConvertModel(name: "英尺", absValue: "0.3048", key: "", unit: "ft");
  static final inch = ConvertModel(name: "英寸", absValue: "0.0254", key: "", unit: "in");
  static final gongli = ConvertModel(name: "公里", absValue: "1000", key: "", unit: "gongli");
  static final li = ConvertModel(name: "里", absValue: "500", key: "", unit: "li");
  static final zhang = ConvertModel(name: "丈", absValue: (Decimal.fromInt(10)/Decimal.fromInt(3)).toString(), key: "", unit: "zhang");
  static final chi = ConvertModel(name: "尺", absValue: (Decimal.fromInt(1)/Decimal.fromInt(3)).toString(), key: "", unit: "chi");
  static final cun = ConvertModel(name: "寸", absValue: (Decimal.fromInt(1)/Decimal.fromInt(30)).toString(), key: "", unit: "cun");
  static final fen = ConvertModel(name: "分", absValue: (Decimal.fromInt(1)/Decimal.fromInt(300)).toString(), key: "", unit: "fen");
  static final lii = ConvertModel(name: "厘", absValue: (Decimal.fromInt(1)/Decimal.fromInt(3000)).toString(), key: "", unit: "lii");
  static final hao = ConvertModel(name: "毫", absValue: (Decimal.fromInt(1)/Decimal.fromInt(30000)).toString(), key: "", unit: "hao");
  static final parsec = ConvertModel(name: "秒差距", absValue: (Decimal.fromInt(308567758)*Decimal.fromInt(100000000)).toString(), key: "", unit: "pc");
  static final lunardistance= ConvertModel(name: "月球距离", absValue: "384401000", key: "", unit: "ld");
  static final astronomicaluint = ConvertModel(name: "天文单位", absValue: "149597871000", key: "", unit: "m");
  static final lightyear = ConvertModel(name: "光年", absValue: (Decimal.fromInt(946073047)*Decimal.fromInt(10000000)).toString(), key: "", unit: "ly");
}