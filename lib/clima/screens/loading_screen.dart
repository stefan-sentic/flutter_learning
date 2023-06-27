import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:learning/clima/screens/location_screen.dart';
import 'package:learning/clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }

  Future<bool> hasLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    return permission == LocationPermission.always || permission == LocationPermission.whileInUse;
  }

  void getLocationData() async {
    final hasPermission = await hasLocationPermission();
    if (!hasPermission && context.mounted) {
      showPermissionDeniedAlert(context);
      return;
    }

    final weatherData = await WeatherUtils().getWeatherData();

    if (weatherData == null && context.mounted) {
      showNoDataAlert(context);
    } else if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return LocationScreen(weatherData: weatherData!);
        }),
      );
    }
  }

  void showPermissionDeniedAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Location permission not allowed"),
              content: const Text(
                  "Please allow location permission in settings in order to use this app."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            ));
  }

  void showNoDataAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Unable to get weather info"),
              content: const Text("Please try again latter."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            ));
  }
}
