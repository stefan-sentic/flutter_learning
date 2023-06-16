import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learning/clima/model/weather.dart';

import '../model/location.dart';

const apiKey = '6a30faa793bca81b6ecdcd5e61ed2a39';
const baseUrl = 'https://api.openweathermap.org/data/3.0/onecall?';

class NetworkHelper {
  // static final NetworkHelper _instance = NetworkHelper._internal();
  //
  // NetworkHelper._internal();
  //
  // factory NetworkHelper() {
  //   return _instance;
  // }

  static Future<WeatherData?> getWeatherData(Location location) async {
    final url = '${baseUrl}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey';

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);

      final double temperature = decodedData['main']['temp'];
      final int condition = decodedData['main'][0]['id'];
      final String cityName = decodedData['name'];
      return WeatherData(temperature, condition, cityName);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
