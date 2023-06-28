import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learning/bitcoin_ticker/screen/price_screen.dart';
import 'package:learning/bitcoin_ticker/util/coin_data_source.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _BitcoinLoaderScreenState();
}

class _BitcoinLoaderScreenState extends State<LoaderScreen> {
  @override
  void initState() {
    super.initState();
    getAvailableCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitCircle(
        color: Colors.blueAccent,
      ),
    );
  }

  void getAvailableCurrencies() async {
    final currencies = await CoinDataSource().getAvailableCurrencies();
    if (currencies == null || currencies.isEmpty) {
      showNoCurrenciesDialog();
    } else if (context.mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return PriceScreen(currencies);
      }));
    }
  }

  void showNoCurrenciesDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: const Text('Unable to load currencies information.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                )
              ],
            ));
  }
}
