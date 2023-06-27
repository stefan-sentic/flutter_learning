import 'package:learning/clima/model/weather.dart';
import 'package:learning/clima/services/network_request.dart';

import '../model/location.dart';

const apiKey = '6a30faa793bca81b6ecdcd5e61ed2a39';
const baseUrl = 'https://api.openweathermap.org/data/2.5/weather?';

class NetworkHelper {

  static Future<WeatherData?> getWeatherData(Location location) async {
    final url = '${baseUrl}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';

    final responseData = await NetworkRequest(url).execute();

    if (responseData != null) {
      final double temperature = responseData['main']['temp'];
      final int condition = responseData['weather'][0]['id'];
      final String cityName = responseData['name'];
      return WeatherData(temperature, condition, cityName);
    } else {
     return null;
    }
  }

  static Future<WeatherData?> getCityWeatherData(String city) async {
    final url = '${baseUrl}q=$city&appid=$apiKey&units=metric';

    final responseData = await NetworkRequest(url).execute();

    if (responseData != null) {
      final double temperature = responseData['main']['temp'];
      final int condition = responseData['weather'][0]['id'];
      final String cityName = responseData['name'];
      return WeatherData(temperature, condition, cityName);
    } else {
     return null;
    }
  }
}
