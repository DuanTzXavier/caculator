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
    switch (statement.operator) {
      case 1:
        result += statement.inputNumber;
        break;
      case 2:
        result -= statement.inputNumber;
        break;
      case 3:
        result *= statement.inputNumber;
        break;
      case 4:
        result /= statement.inputNumber;
        break;
      default:
        result = statement.inputNumber;
        break;
    }
    return result;
  }
}