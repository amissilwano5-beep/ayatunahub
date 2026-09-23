import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<bool> isLocationEnabled() async {
    return Geolocator.isLocationServiceEnabled();
  }

  static Future<bool> requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  static Future<Position?> getCurrentPosition() async {
    final serviceEnabled = await isLocationEnabled();
    if (!serviceEnabled) return null;

    final hasPermission = await requestPermission();
    if (!hasPermission) return null;

    try {
      return await Geolocator.getCurrentPosition();
    } catch (_) {
      return null;
    }
  }
}
