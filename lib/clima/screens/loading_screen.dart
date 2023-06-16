import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:learning/clima/screens/location_screen.dart';
import 'package:learning/clima/services/networking.dart';

import '../model/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocationData() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      return;
    }

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    final location = Location(latitude: position.latitude, longitude: position.longitude);
    final weatherData = await NetworkHelper.getWeatherData(location);

    if (context.mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LocationScreen();
      }));
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      ),
    );
  }
}
