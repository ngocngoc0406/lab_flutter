import 'package:clima/Services/locationServices.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  static const _apiKey = '4bc278c4790e06a14d9ca551e3b30eb8';
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> fetchWeatherByCity(String city) async {
    final url = '$_baseUrl?q=$city&appid=$_apiKey&units=metric';
    return _getData(url);
  }

  Future<dynamic> fetchWeatherByLocation() async {
    final location = await LocationService().getCurrentLocation();
    final url =
        '$_baseUrl?lat=${location['lat']}&lon=${location['lon']}&appid=$_apiKey&units=metric';
    return _getData(url);
  }

  Future<dynamic> _getData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print('Failed to load weather: $e');
    }
    return null;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) return '🌩';
    if (condition < 400) return '🌧';
    if (condition < 600) return '☔️';
    if (condition < 700) return '☃️';
    if (condition < 800) return '🌫';
    if (condition == 800) return '☀️';
    if (condition <= 804) return '☁️';
    return '🤷‍';
  }

  String getMessage(int temp) {
    if (temp > 25) return 'It\'s 🍦 time';
    if (temp > 20) return 'Time for shorts and 👕';
    if (temp < 10) return 'You\'ll need 🧣 and 🧤';
    return 'Bring a 🧥 just in case';
  }
}
