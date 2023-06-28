import 'package:learning/bitcoin_ticker/model/coin_data.dart';
import 'package:learning/clima/services/network_request.dart';

const baseUrl = 'https://api.coingecko.com/api/v3/';
const List<String> cryptoList = ['bitcoin', 'ethereum', 'litecoin','dogecoin', 'binancecoin'];

class CoinDataSource {
  Future<List<String>?> getAvailableCurrencies() async {
    const url = '${baseUrl}simple/supported_vs_currencies';

    final List<dynamic>? response = await NetworkRequest(url).execute();

    return response?.map((e) => e.toString()).toList();
  }

  Future<List<CoinData?>> getAllCoinsPrice(String currency) async {
    return Future.wait(cryptoList.map((e) => getCoinPrice(e, currency)));
  }

  Future<CoinData?> getCoinPrice(String coinId, String currency) async {
    final path = 'simple/price?ids=$coinId&vs_currencies=$currency';
    final url = '$baseUrl$path';

    final response = await NetworkRequest(url).execute();

    if (response != null) {
      final price = response[coinId][currency] + .0;  // The '+ .0' was added because sometimes api returns an integer which can't be implicitly cast to double
      return CoinData(name: coinId, price: price, priceCurrency: currency);
    } else {
      return null;
    }
  }
}
