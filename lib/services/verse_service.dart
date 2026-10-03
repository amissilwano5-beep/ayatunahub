class VerseService {
  /// Returns a dummy verse text based on the surah and ayah numbers.
  /// This keeps the service consistent without relying on an absent package.
  String getVerse(int surah, int ayah) {
    return 'Verse $ayah of Surah $surah';
  }

  /// Returns a simple list of dummy verses.
  List<String> getSurah(int surah) {
    return List.generate(5, (index) => getVerse(surah, index + 1));
  }
}
