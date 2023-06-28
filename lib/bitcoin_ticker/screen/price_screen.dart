import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learning/bitcoin_ticker/util/coin_data_source.dart';

import '../model/coin_data.dart';

class PriceScreen extends StatefulWidget {
  final List<String> currencies;

  const PriceScreen(this.currencies, {super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinDataSource dataSource = CoinDataSource();

  List<String> currencies = [];
  String selectedCurrency = '';
  bool dataLoaded = false;

  List<CoinData> coinData = [];

  @override
  void initState() {
    super.initState();
    currencies = widget.currencies;
    selectedCurrency = currencies.first;
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: dataLoaded ? buildContent() : buildLoader(),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: buildCurrencyPicker(),
          ),
        ],
      ),
    );
  }

  Widget buildLoader() {
    return const Center(
        child: SpinKitCircle(
      color: Colors.blueAccent,
    ));
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: coinData
            .map((coin) =>
                buildCoinCard(coinName: coin.name, price: coin.price, currency: coin.priceCurrency))
            .toList(),
      ),
    );
  }

  Card buildCoinCard({required String coinName, required double price, required String currency}) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $coinName = ${price.toStringAsFixed(3)} $currency',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildCurrencyPicker() {
    return Platform.isAndroid
        ? Container(
      width: 160,
          child: DropdownButtonFormField<String>(
              value: selectedCurrency,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              iconEnabledColor: Colors.blueAccent,
              style: const TextStyle(color: Colors.blueAccent, fontSize: 18),
              items: currencies
                  .map((currency) => DropdownMenuItem<String>(value: currency, child: Text(currency)))
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  if (value != null) {
                    selectedCurrency = value;
                    dataLoaded = false;
                    loadData();
                  }
                });
              },
            ),
        )
        : CupertinoPicker(
            itemExtent: 32,
            onSelectedItemChanged: (index) {},
            children: currencies.map((currency) => Text(currency)).toList());
  }

  Future<void> loadData() async {
    final prices = await CoinDataSource().getAllCoinsPrice(selectedCurrency);
    setState(() {
      coinData = prices.nonNulls.toList();
      dataLoaded = true;
    });
  }
}
