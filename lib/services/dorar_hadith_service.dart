import 'package:dorar_hadith/dorar_hadith.dart';

class DorarHadithService {
  static const List<Hadith> _fallbackHadiths = [
    Hadith(
      hadith: 'إنَّمَا الأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى',
      rawi: 'صحيح البخاري و مسلم',
      mohdith: 'الإمام البخاري',
      book: 'Sahih al-Bukhari',
      numberOrPage: '1',
      grade: 'صحيح',
    ),
    Hadith(
      hadith: 'مَنْ سَلَكَ طَرِيقًا يَلْتَمِسُ فِيهِ عِلْمًا سَهَّلَ اللَّهُ لَهُ بِهِ طَرِيقًا إِلَى الْجَنَّةِ',
      rawi: 'مسند الإمام أحمد',
      mohdith: 'أبو هريرة',
      book: 'Sunan Abi Dawud',
      numberOrPage: '2',
      grade: 'حسن',
    ),
    Hadith(
      hadith: 'لا يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لِأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ',
      rawi: 'صحيح البخاري',
      mohdith: 'أنس بن مالك',
      book: 'Sahih Muslim',
      numberOrPage: '3',
      grade: 'صحيح',
    ),
  ];

  static Future<DorarHadithSnapshot> loadFeaturedHadiths() async {
    final client = DorarClient();

    try {
      final bookCount = await client.bookRef.countBooks();
      final queries = ['النية', 'الصلاة', 'الأخلاق', 'التقوى'];
      final List<Hadith> featured = [];

      for (final query in queries) {
        final result = await client.searchHadith(
          HadithSearchParams(
            value: query,
            page: 1,
            removeHtml: true,
          ),
        );

        featured.addAll(result.data);
        if (featured.length >= 5) {
          break;
        }
      }

      final ordered = featured.toSet().toList();

      return DorarHadithSnapshot(
        bookCount: bookCount,
        featured: ordered.length >= 3 ? ordered.take(5).toList() : _fallbackHadiths,
      );
    } catch (_) {
      return const DorarHadithSnapshot(
        bookCount: 688,
        featured: _fallbackHadiths,
      );
    } finally {
      await client.dispose();
    }
  }
}

class DorarHadithSnapshot {
  final int bookCount;
  final List<Hadith> featured;

  const DorarHadithSnapshot({
    required this.bookCount,
    required this.featured,
  });
}
