class CoinModel {
  String time;
  String asset_id_base;
  String asset_id_quote;
  double rate;

  CoinModel.fromJson(Map json) {
    this.time = json["time"];
    this.asset_id_base = json["asset_id_base"];
    this.asset_id_quote = json["asset_id_quote"];
    this.rate = json["rate"];
  }
}
