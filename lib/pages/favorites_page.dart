import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/quran_sample.dart';
import '../services/dorar_hadith_service.dart';
import '../services/storage_service.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<_FavoriteItem>> _favoritesFuture;

  @override
  void initState() {
    super.initState();
    _favoritesFuture = _loadFavorites();
  }

  Future<List<_FavoriteItem>> _loadFavorites() async {
    final favoriteSurahIds = StorageService.getFavoriteSurahs();
    final favoriteHadiths = StorageService.getFavoriteHadiths();

    final surahs = quranSample
        .where((surah) => favoriteSurahIds.contains(surah.number.toString()))
        .map(
          (surah) => _FavoriteItem(
            title: '${surah.number}. ${surah.englishName}',
            subtitle: surah.arabicName,
            icon: Icons.menu_book_rounded,
            color: const Color(0xFF0C6B4E),
          ),
        )
        .toList();

    final hadithSnapshot = await DorarHadithService.loadFeaturedHadiths();
    final hadiths = hadithSnapshot.featured
        .where((hadith) => favoriteHadiths.contains(hadith.book))
        .map(
          (hadith) => _FavoriteItem(
            title: hadith.book,
            subtitle: hadith.hadith,
            icon: Icons.format_quote_rounded,
            color: const Color(0xFFD7B45C),
          ),
        )
        .toList();

    return [...surahs, ...hadiths];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes favoris',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder<List<_FavoriteItem>>(
        future: _favoritesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final items = snapshot.data ?? const <_FavoriteItem>[];
          if (items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.bookmark_border_rounded, size: 60, color: Color(0xFF0C6B4E)),
                    const SizedBox(height: 16),
                    Text(
                      'Aucun favori pour le moment',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF183729),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ajoutez des sourates ou hadiths à votre liste depuis les pages correspondantes.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black.withValues(alpha: 0.04)),
                ),
                child: ListTile(
                  leading: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: item.color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(item.icon, color: item.color),
                  ),
                  title: Text(
                    item.title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF183729),
                    ),
                  ),
                  subtitle: Text(
                    item.subtitle,
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _FavoriteItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _FavoriteItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}
