import 'package:bitcoin_ticker/coin_model.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

//URL EX.
//https://rest.coinapi.io/v1/exchangerate/BTC/BRL?apikey=DA007E6E-8EAD-40DA-B8F2-ADB3E87B451A

/* 
{
  "time": "2020-05-18T15:31:23.9546097Z",
  "asset_id_base": "BTC",
  "asset_id_quote": "BRL",
  "rate": 56059.572462892511041039214512
}
*/
class CoinData {
  final _apiKey = 'DA007E6E-8EAD-40DA-B8F2-ADB3E87B451A';

  Future<CoinModel> getCoinData(String crypto, String selectedCurrency) async {
    CoinModel coinModel;
    try {
      final url =
          "https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency/?apiKey=$_apiKey";
      // https://rest.coinapi.io/v1/exchangerate/BTC/BRL/?apiKey=DA007E6E-8EAD-40DA-B8F2-ADB3E87B451A

      print(url);
      var ret = await http.get(url);
      if (ret.statusCode == 200) {
        var json = jsonDecode(ret.body);
        print(json);
        coinModel = CoinModel.fromJson(json);
        // for (var o in json["rates"]) {
        //   _listModel.add(CoinModel.fromJson(o));
        // }
      } else {
        coinModel = null;
      }
    } catch (e) {
      print("Exeption on: " + e);
    }
    return coinModel;
  }
}
