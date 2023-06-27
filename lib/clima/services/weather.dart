import 'package:geolocator/geolocator.dart';
import 'package:learning/clima/model/weather.dart';

import '../model/location.dart';
import 'networking.dart';

class WeatherUtils {

  Future<WeatherData?> getWeatherDataForCity(String cityName) async {
    return NetworkHelper.getCityWeatherData(cityName);
  }

  Future<WeatherData?> getWeatherData() async {
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    final location = Location(latitude: position.latitude, longitude: position.longitude);
    return NetworkHelper.getWeatherData(location);
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
