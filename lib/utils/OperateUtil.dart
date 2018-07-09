import 'package:calculator/viewmodel/Statement.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OperateUtil {

  static IconData getStatementOperatorIcon(int operator) {
    IconData operatorIcon;
    switch (operator) {
      case 1:
        operatorIcon = Icons.add;
        break;
      case 2:
        operatorIcon = Icons.remove;
        break;
      case 3:
        operatorIcon = Icons.clear;
        break;
      case 4:
        operatorIcon = MdiIcons.division;
        break;
      case 5:
        operatorIcon = MdiIcons.equal;
        break;
      default:
        operatorIcon;
        break;
    }
    return operatorIcon;
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
      case 5:
        result = Decimal.fromInt(0);
        break;
      default:
        result = operatorNumber;
        break;
    }
    return result;
  }
}