import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Map<String, double>> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      return {'lat': position.latitude, 'lon': position.longitude};
    } catch (e) {
      print('Location error: $e');
      return {'lat': 0.0, 'lon': 0.0};
    }
  }
}
