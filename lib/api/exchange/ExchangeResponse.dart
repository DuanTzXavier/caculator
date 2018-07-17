import 'package:calculator/api/exchange/ExchangeResult.dart';

class ExchangeResponse {
  final String success;
  final ExchangeResult result;

  ExchangeResponse(this.success, this.result);

  ExchangeResponse.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        result = ExchangeResult.fromJson(json['result']);
}