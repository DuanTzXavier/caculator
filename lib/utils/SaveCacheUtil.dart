import 'dart:async';

import 'package:calculator/viewmodel/Statement.dart';
import 'package:decimal/decimal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveCacheUtil {

  static Future<List<Statement>> getStatements() async {
    List<Statement> statements = List();
    List<String> numebrs;
    List<String> operators;
    numebrs = await getListFromCache("numbers");
    operators = await getListFromCache("operators");

    if (numebrs != null && operators != null && numebrs.length == operators.length){
      for(int i = 0;i < numebrs.length;i ++){
        Statement statement = Statement();
        statement.operator = operators[i] == null ? 0 : int.parse(operators[i]);
        statement.inputNumber = Decimal.parse(numebrs[i]);
        statements.add(statement);
      }
    }

    return statements;
  }


  static saveStatements(List<Statement> statements) {
    List<String> numbers = List();
    List<String> operators = List();

    for (var statement in statements) {
      numbers.add(statement.inputNumber.toString());
      operators.add(statement.operator == null ? "0" : statement.operator.toString());
    }
    saveToCache("numbers", numbers);
    saveToCache("operators", operators);
  }

  static Future<bool> saveToCache(String key, Object object) async {
    bool result;
    SharedPreferences cache = await SharedPreferences.getInstance();
    if (object is String) {
      result = await cache.setString(key, object);
    } else if (object is int) {
      result = await cache.setInt(key, object);
    } else if (object is bool) {
      result = await cache.setBool(key, object);
    } else if (object is double) {
      result = await cache.setDouble(key, object);
    } else if (object is List<String>) {
      result = await cache.setStringList(key, object);
    } else {
      result = false;
    }

    return result;
  }

  static Future<List<String>> getListFromCache(String key) async {
    SharedPreferences cache = await SharedPreferences.getInstance();
    return cache.getStringList(key);
  }

  static Future<Object> getFromCache(String key) async {
    SharedPreferences cache = await SharedPreferences.getInstance();
    return cache.get(key);
  }

  static Future<String> getExchangeConvert(key) async{
    SharedPreferences cache = await SharedPreferences.getInstance();
    return cache.getString(key);
  }
}