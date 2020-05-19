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
  bool isLoading;

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
        });
        getData();
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
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
        });
        getData();
      },
    );
  }

  void getData() async {
    isLoading = true;
    var bTCValue = (await coinData.getCoinData("BTC", selectedCurrency)).rate;
    var eTHValue = (await coinData.getCoinData("ETH", selectedCurrency)).rate;
    var lTCValue = (await coinData.getCoinData("LTC", selectedCurrency)).rate;

    setState(() {
      currencyBTCValue = bTCValue;
      currencyETHValue = eTHValue;
      currencyLTCValue = lTCValue;
    });
    isLoading = false;
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
                coinValue: isLoading ? 0.0 : currencyBTCValue,
                selectedCoin: selectedCurrency,
              ),
              CriptoCurrencyCard(
                cryptoCurrencyText: "ETH",
                coinValue: isLoading ? 0.0 : currencyETHValue,
                selectedCoin: selectedCurrency,
              ),
              CriptoCurrencyCard(
                cryptoCurrencyText: "LTC",
                coinValue: isLoading ? 0.0 : currencyLTCValue,
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
    final formatedValue = coinValue.toStringAsFixed(2);
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlue,
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "1 $cryptoCurrencyText =  $formatedValue $selectedCoin",
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
