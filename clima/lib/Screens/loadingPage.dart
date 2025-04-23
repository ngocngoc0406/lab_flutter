import 'package:clima/Screens/locationPage.dart';
import 'package:clima/Services/weatherServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  void fetchWeather() async {
    var data = await WeatherService().fetchWeatherByLocation();
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationPage(weatherData: data),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SpinKitDoubleBounce(color: Colors.white, size: 50.0)),
    );
  }
}
