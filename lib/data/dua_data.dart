class DuaItem {
  final String id;
  final String title;
  final String arabic;
  final String transliteration;
  final String translation;

  DuaItem({required this.id, required this.title, required this.arabic, required this.transliteration, required this.translation});
}

final List<DuaItem> duaList = [
  DuaItem(
    id: 'dua_entering_masjid',
    title: "Dua en entrant dans la mosquée",
    arabic: 'اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ',
    transliteration: "Allahumma iftah li abwaba rahmatik",
    translation: "Ô Allah, ouvre pour moi les portes de Ta miséricorde",
  ),
  DuaItem(
    id: 'dua_travel',
    title: 'Dua for travel',
    arabic: 'سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا',
    transliteration: 'Subhana allathee sakhkhara lana hadha',
    translation: 'Gloire à Celui qui a assujetti cela pour nous',
  ),
  DuaItem(
    id: 'dua_before_sleep',
    title: 'Dua before sleep',
    arabic: 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
    transliteration: 'Bismika Allahumma amutu wa ahya',
    translation: 'Au nom de Toi, ô Allah, je meurs et je vis',
  ),
];
