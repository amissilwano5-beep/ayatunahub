import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> getFavoriteSurahs() {
    return _prefs.getStringList('favorite_surahs') ?? <String>[];
  }

  static Future<void> saveFavoriteSurahs(List<String> values) async {
    await _prefs.setStringList('favorite_surahs', values);
  }

  static List<String> getFavoriteHadiths() {
    return _prefs.getStringList('favorite_hadiths') ?? <String>[];
  }

  static Future<void> saveFavoriteHadiths(List<String> values) async {
    await _prefs.setStringList('favorite_hadiths', values);
  }
}
