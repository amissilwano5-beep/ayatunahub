class AzkarItem {
  final String id;
  final String title;
  final String arabic;
  final String transliteration;
  final String translation;

  AzkarItem({required this.id, required this.title, required this.arabic, required this.transliteration, required this.translation});
}

final List<AzkarItem> azkarList = [
  AzkarItem(
    id: 'morning_1',
    title: 'Invocation du matin 1',
    arabic: 'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيمِ',
    transliteration: 'Bismillah ar-Rahman ar-Raheem',
    translation: "Au nom d'Allah, le Tout Miséricordieux, le Très Miséricordieux",
  ),
  AzkarItem(
    id: 'evening_1',
    title: 'Invocation du soir 1',
    arabic: 'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ',
    transliteration: 'Asbahna wa asbaha al-mulku lillah',
    translation: "Nous sommes entrés dans le matin et la royauté appartient à Allah",
  ),
  AzkarItem(
    id: 'sleep_1',
    title: 'Invocation avant le sommeil',
    arabic: 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
    transliteration: 'Bismika Allahumma amutu wa ahya',
    translation: "Au nom de Toi, ô Allah, je meurs et je vis",
  ),
];
