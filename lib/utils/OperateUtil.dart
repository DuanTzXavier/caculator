import 'package:caculator/viewmodel/Statement.dart';
import 'package:decimal/decimal.dart';

class OperateUtil {
  static String getStatementOperator(int operator) {
    String operatorText = " ";
    switch (operator) {
      case 1:
        operatorText = "+";
        break;
      case 2:
        operatorText = "-";
        break;
      case 3:
        operatorText = "*";
        break;
      case 4:
        operatorText = "/";
        break;
      case 5:
        operatorText = "=";
        break;
      default:
        operatorText = " ";
        break;
    }
    return operatorText;
  }

  static Decimal calculateStatement(Decimal result, Statement statement) {

    Decimal operatorNumber = statement.inputNumber;

    if (operatorNumber == null){
      if (statement.operator > 2) {
        operatorNumber = Decimal.fromInt(1);
      } else {
        operatorNumber = Decimal.fromInt(0);
      }
    }

    switch (statement.operator) {
      case 1:
        result += operatorNumber;
        break;
      case 2:
        result -= operatorNumber;
        break;
      case 3:
        result *= operatorNumber;
        break;
      case 4:
        result /= operatorNumber;
        break;
      default:
        result = operatorNumber;
        break;
    }
    return result;
  }
}