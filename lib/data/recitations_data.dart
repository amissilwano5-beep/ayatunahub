class Recitation {
  final String id;
  final String title;
  final String url;
  final String narrator;

  Recitation({required this.id, required this.title, required this.url, required this.narrator});
}

final List<Recitation> sampleRecitations = [
  Recitation(
    id: 'khalil',
    title: 'Al-Fatiha — Khalil Al-Husary (sample)',
    url: 'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3',
    narrator: 'Khalil Al-Husary',
  ),
  Recitation(
    id: 'abdul',
    title: 'Al-Baqara — Example Recitation',
    url: 'https://www.learningcontainer.com/wp-content/uploads/2020/02/StarWars60.wav',
    narrator: 'Example Reader',
  ),
];
