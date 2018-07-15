/**
    "result": {
    "status": "ALREADY",
    "scur": "CNY",
    "tcur": "EUR",
    "ratenm": "人民币/欧元",
    "rate": "0.127839",
    "update": "2018-07-13 23:28:01"
    }
 */

///
class ExchangeResult {
  final String status;
  final String scur;
  final String tcur;
  final String ratem;
  final String rate;
  final String update;

  ExchangeResult(this.status, this.scur, this.tcur, this.ratem, this.rate,
      this.update,);

  ExchangeResult.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        scur = json['scur'],
        tcur = json['tcur'],
        ratem = json['ratem'],
        rate = json['rate'],
        update = json['update'];

}