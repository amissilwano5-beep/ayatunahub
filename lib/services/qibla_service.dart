import 'dart:math';

class QiblaService {
  // Coordonnées de la Mecque
  static const double meccaLatitude = 21.4225;
  static const double meccaLongitude = 39.8262;

  // Calculer l'angle de la Qibla à partir de la position de l'utilisateur
  static double calculateQiblaAngle(double userLat, double userLng) {
    double lat1 = _toRadians(userLat);
    double lng1 = _toRadians(userLng);
    double lat2 = _toRadians(meccaLatitude);
    double lng2 = _toRadians(meccaLongitude);

    double deltaLng = lng2 - lng1;

    double x = sin(deltaLng) * cos(lat2);
    double y = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(deltaLng);

    double angle = atan2(x, y);
    angle = _toDegrees(angle);
    angle = (angle + 360) % 360; // Normaliser entre 0 et 360

    return angle;
  }

  static double _toRadians(double degrees) {
    return degrees * pi / 180;
  }

  static double _toDegrees(double radians) {
    return radians * 180 / pi;
  }

  // Obtenir la direction cardinale (N, NE, E, SE, S, SO, O, NO)
  static String getCardinalDirection(double angle) {
    if (angle >= 337.5 || angle < 22.5) return 'N';
    if (angle >= 22.5 && angle < 67.5) return 'NE';
    if (angle >= 67.5 && angle < 112.5) return 'E';
    if (angle >= 112.5 && angle < 157.5) return 'SE';
    if (angle >= 157.5 && angle < 202.5) return 'S';
    if (angle >= 202.5 && angle < 247.5) return 'SO';
    if (angle >= 247.5 && angle < 292.5) return 'O';
    if (angle >= 292.5 && angle < 337.5) return 'NO';
    return '';
  }
}