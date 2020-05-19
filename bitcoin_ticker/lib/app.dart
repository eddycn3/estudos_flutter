import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:io" show Platform;
import "coin_data.dart";

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  CoinData coinData = CoinData();
  String selectedCurrency = "BRL";
  double currencyBTCValue = 0;
  double currencyETHValue = 0;
  double currencyLTCValue = 0;

  DropdownButton<String> getDroidDropDown() {
    List<DropdownMenuItem<String>> listItens = [];
    for (String item in currenciesList) {
      listItens.add(DropdownMenuItem(
        child: Text(
          item,
          style: TextStyle(fontSize: 20),
        ),
        value: item,
      ));
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: listItens,
      onChanged: (newValue) {
        setState(() {
          selectedCurrency = newValue;
          getData();
        });
      },
    );
  }

  CupertinoPicker getIOSDropDown() {
    List<Text> listItens = [];
    for (String item in currenciesList) {
      listItens.add(Text(
        item,
        style: TextStyle(color: Colors.white),
      ));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      children: listItens,
      itemExtent: 42,
      onSelectedItemChanged: (selectedIndex) {},
    );
  }

// {
//   "time": "2020-05-18T15:31:23.9546097Z",
//   "asset_id_base": "BTC",
//   "asset_id_quote": "BRL",
//   "rate": 56059.572462892511041039214512
// }

  Future getData() async {
    var values = await coinData.getCoinData(selectedCurrency);
    print(values);
    if (values == null) return;

    for (var coinModel in values) {
      switch (coinModel.asset_id_quote) {
        case ("BTC"):
          currencyBTCValue = coinModel.rate;
          break;
        case ("ETH"):
          currencyETHValue = coinModel.rate;
          break;
        case ("LTC"):
          currencyLTCValue = coinModel.rate;
          break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bitcoin Ticker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CriptoCurrencyCard(
                cryptoCurrencyText: "BTC",
                coinValue: currencyBTCValue,
                selectedCoin: selectedCurrency,
              ),
              CriptoCurrencyCard(
                cryptoCurrencyText: "ETH",
                coinValue: currencyETHValue,
                selectedCoin: selectedCurrency,
              ),
              CriptoCurrencyCard(
                cryptoCurrencyText: "LTC",
                coinValue: currencyLTCValue,
                selectedCoin: selectedCurrency,
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(top: 10.0),
              height: Platform.isIOS ? 150.0 : 80.0,
              alignment: Alignment.center,
              color: Colors.lightBlue,
              width: double.infinity,
              child: Platform.isIOS ? getIOSDropDown() : getDroidDropDown())
        ],
      ),
    );
  }
}

class CriptoCurrencyCard extends StatelessWidget {
  final String cryptoCurrencyText;
  final double coinValue;
  final String selectedCoin;

  CriptoCurrencyCard(
      {this.cryptoCurrencyText, this.coinValue, this.selectedCoin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlue,
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "1 $cryptoCurrencyText = $coinValue $selectedCoin",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
