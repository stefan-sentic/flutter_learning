import 'package:flutter/material.dart';
import 'package:learning/clima/screens/city_screen.dart';
import 'package:learning/clima/services/weather.dart';

import '../model/weather.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final WeatherData weatherData;

  const LocationScreen({super.key, required this.weatherData});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherUtils weatherUtils = WeatherUtils();
  String message = '';
  String cityName = '';
  String weatherIcon = '';
  String temperature = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(WeatherData weatherData) {
    setState(() {
      weatherIcon = weatherUtils.getWeatherIcon(weatherData.condition);
      message = weatherUtils.getMessage(weatherData.temperature.toInt());
      cityName = weatherData.cityName;
      temperature = '${weatherData.temperature.toInt()}°';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('lib/clima/image/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      final data = await weatherUtils.getWeatherData();
                      if (data != null) {
                        updateUI(data);
                      }
                    },
                    child: const Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final String? cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const CityScreen();
                        }),
                      );
                      if (cityName != null && cityName.isNotEmpty) {
                        final data = await weatherUtils.getWeatherDataForCity(cityName);
                        if (data != null) {
                          updateUI(data);
                        }
                      }
                    },
                    child: const Icon(
                      color: Colors.white,
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      temperature,
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  '$message in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
