import 'package:geolocator/geolocator.dart';

class LocationService {
  // Vérifier si la localisation est activée
  static Future<bool> isLocationEnabled() async {
    return Geolocator.isLocationServiceEnabled();
  }

  // Demander la permission
  static Future<bool> requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  // Obtenir la position actuelle
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

  // Écouter les changements de position en temps réel
  static Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream();
  }
}