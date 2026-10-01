import 'package:quran/quran.dart' as quran;

class VerseService {
  /// Returns Arabic verse text for given surah and ayah using `quran` package.
  String getVerse(int surah, int ayah) {
    return quran.getVerse(surah, ayah, format: quran.VerseFormat.arabic);
  }

  /// Returns the entire surah as a list of verses (strings).
  List<String> getSurah(int surah) {
    final count = quran.getVerseCount(surah);
    return List.generate(count, (i) => getVerse(surah, i + 1));
  }
}
