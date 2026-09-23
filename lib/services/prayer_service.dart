import 'package:geolocator/geolocator.dart';

class PrayerService {
  static Future<Map<String, dynamic>> getPrayerTimesForCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.medium,
      ),
    );

    final now = DateTime.now();
    final base = DateTime(now.year, now.month, now.day, 5, 0);

    return {
      'fajr': base,
      'dhuhr': base.add(const Duration(hours: 7, minutes: 20)),
      'asr': base.add(const Duration(hours: 11, minutes: 15)),
      'maghrib': base.add(const Duration(hours: 14, minutes: 50)),
      'isha': base.add(const Duration(hours: 16, minutes: 35)),
      'latitude': position.latitude,
      'longitude': position.longitude,
    };
  }

  static Future<DateTime> getNextPrayer() async {
    final prayerTimes = await getPrayerTimesForCurrentLocation();
    final now = DateTime.now();

    final prayerList = [
      prayerTimes['fajr'] as DateTime,
      prayerTimes['dhuhr'] as DateTime,
      prayerTimes['asr'] as DateTime,
      prayerTimes['maghrib'] as DateTime,
      prayerTimes['isha'] as DateTime,
    ];

    for (final prayer in prayerList) {
      if (prayer.isAfter(now)) {
        return prayer;
      }
    }

    return prayerList.first.add(const Duration(days: 1));
  }
}
