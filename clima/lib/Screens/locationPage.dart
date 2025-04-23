import 'package:clima/Screens/cityPage.dart';
import 'package:clima/Services/weatherServices.dart';
import 'package:clima/Utils/constant.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  final dynamic weatherData;
  const LocationPage({super.key, required this.weatherData});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late int temperature;
  late String weatherIcon;
  late String city;
  late String message;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic data) {
    if (data == null) {
      temperature = 0;
      weatherIcon = '❗';
      message = 'Không thể lấy dữ liệu';
      city = '';
    } else {
      temperature = data['main']['temp'].toInt();
      city = data['name'];
      weatherIcon = WeatherService().getWeatherIcon(data['weather'][0]['id']);
      message = WeatherService().getMessage(temperature);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.near_me, size: 50),
                    onPressed: () async {
                      var data =
                          await WeatherService().fetchWeatherByLocation();
                      setState(() => updateUI(data));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.location_city, size: 50),
                    onPressed: () async {
                      var name = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CityPage()),
                      );
                      if (name != null) {
                        var data = await WeatherService().fetchWeatherByCity(
                          name,
                        );
                        setState(() => updateUI(data));
                      }
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$temperature°',
                    style: kTempTextStyle.copyWith(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black45,
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(weatherIcon, style: TextStyle(fontSize: 80)),
                ],
              ),

              const SizedBox(height: 20),

              // Giao diện hiển thị message
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$message in $city',
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
