import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

class ShowTextNumberUtil {
  static NumberFormat format = NumberFormat();

  static String showTextNumber(Decimal number) {
    if (number == null) {
      return "";
    }
    var result = number.toString();

    if (number == Decimal.fromInt(0)){
      result = "0";
    } else if (number.abs() < Decimal.parse("0.00001")) {
      result = format.parse(number.toString()).toString();
    } else if (number > Decimal.parse("9999999999")) {
      result = format.parse(number.toString()).toStringAsExponential();
      if(result.length > 12){
        result = format.parse(number.toString()).toStringAsExponential(6);
      }
      if(result.length > 12){
        result = format.parse(number.toString()).toStringAsExponential(4);
      }
    } else if(number > Decimal.parse("999")){
      result = format.format(format.parse(number.toString()));
    }else {
      result = number.toString();
    }
    return result;
  }



  static String showTextInputNumber(Decimal number) {
    if (number == null) {
      return "";
    }
    var result = number.toString();

    if (number > Decimal.parse("999999999999999")) {
      result = format.parse(number.toString()).toStringAsExponential();
      if(result.length > 15){
        result = format.parse(number.toString()).toStringAsExponential(6);
      }
    }else if(number > Decimal.parse("999")){
      result = format.format(format.parse(number.toString()));
    }else {
      result = number.toString();
    }

    return result;
  }

  static String showTextInputNumberFromString(String number) {
    if (number == null || number.isEmpty) {
      return "";
    }
    var result= "";

    if (number.contains(".")){
      var numbers = number.split(".");
      if(numbers!= null && numbers.length == 2){
        result = showTextInputNumber(Decimal.parse(numbers[0]));
        result += "." + numbers[1].toString();
      }else{
        result = number;
      }
    }else{
      result = showTextInputNumber(Decimal.parse(number));
    }

    return result;
  }

  static String showTextNumberFromString(String number) {
    return showTextNumber(Decimal.parse(number));
  }
}