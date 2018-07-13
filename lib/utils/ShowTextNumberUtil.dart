import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

class ShowTextNumberUtil {
  static NumberFormat format = NumberFormat();

  static String showTextNumber(Decimal number) {
    if (number == null) {
      return "";
    }
    var result = number.toString();

    if (number.abs() < Decimal.parse("0.00001")) {
      result = format.parse(number.toString()).toString();
      print("123:" + result);
    } else if (number > Decimal.parse("99999999999999")) {
      result = format.parse(number.toString()).toStringAsExponential();
      if(result.length > 15){
        result = format.parse(number.toString()).toStringAsExponential(6);
      }
      print("234:" + result);
    } else if(number > Decimal.parse("999")){
      result = format.format(format.parse(number.toString()));
      print("00123:" + result);
      print("00123:" + number.toString());
    }else {
      result = number.toString();
    }
//    print(result);
    return result;
  }

  static String showTextInputNumber(Decimal number) {
    if (number == null) {
      return "";
    }
    var result = number.toString();

    if (number > Decimal.parse("999999999999")) {
      result = format.parse(number.toString()).toStringAsExponential();
      if(result.length > 15){
        result = format.parse(number.toString()).toStringAsExponential(6);
      }
      print("234:" + result.length.toString());
    }else if(number > Decimal.parse("999")){
      result = format.format(format.parse(number.toString()));
      print("00123:" + result);
      print("00123:" + number.toString());
    }else {
      result = number.toString();
    }

    return result;
  }

  static String showTextInputNumberFromString(String number) {
    if (number == null || number.isEmpty) {
      return "";
    }
    bool isEndWithPoint = number.endsWith(".");
    return showTextInputNumber(Decimal.parse(
        isEndWithPoint ? number.substring(0, number.length - 1) : number)
    ) + (isEndWithPoint ? "." : "");
  }

  static String showTextNumberFromString(String number) {
    return showTextNumber(Decimal.parse(number));
  }
}