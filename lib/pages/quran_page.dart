import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_audio/quran_audio.dart';
import 'package:quran_with_tafsir/quran_with_tafsir.dart';

import '../data/quran_catalog.dart';
import '../data/quran_sample.dart';
import '../services/storage_service.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedTranslation = 'Tout';
  bool _showOnlyFavorites = false;
  Set<String> _favoriteSurahIds = <String>{};

  // Package-backed surah list (optional)
  List<QuranCatalogItem>? packageSurahs;
  bool loadingPackage = false;

  @override
  void initState() {
    super.initState();
    _favoriteSurahIds = StorageService.getFavoriteSurahs().toSet();
    _loadPackageSurahs();
  }

  Future<void> _loadPackageSurahs() async {
    setState(() => loadingPackage = true);
    try {
      final meta = QuranService.instance.getAllSurahs();
      final mapped = meta
          .map((m) => QuranCatalogItem(
                number: m.number,
                englishName: m.nameEn,
                arabicName: m.nameAr,
                frenchName: '',
                verseCount: m.ayahCount,
                description: m.revelationType ?? '',
              ))
          .toList();
      setState(() => packageSurahs = mapped);
    } catch (_) {
      // leave packageSurahs null to fall back to bundled catalog
    } finally {
      setState(() => loadingPackage = false);
    }
  }

  Future<void> _toggleFavorite(String surahId) async {
    setState(() {
      if (_favoriteSurahIds.contains(surahId)) {
        _favoriteSurahIds.remove(surahId);
      } else {
        _favoriteSurahIds.add(surahId);
      }
    });

    await StorageService.saveFavoriteSurahs(_favoriteSurahIds.toList());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();
    final usePackage = packageSurahs != null;
    final sourceList = usePackage ? packageSurahs! : quranCatalog;
    final filteredSurah = sourceList.where((surah) {
      final matchesQuery = query.isEmpty ||
          surah.englishName.toLowerCase().contains(query) ||
          surah.arabicName.toLowerCase().contains(query) ||
          surah.frenchName.toLowerCase().contains(query);
      final isFavorite = _favoriteSurahIds.contains(surah.number.toString());
      return matchesQuery && (!_showOnlyFavorites || isFavorite);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lire le Coran',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        actions: [
          if (loadingPackage)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Center(child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))),
            ),
          IconButton(
            tooltip: 'Source',
            onPressed: () async {
              if (packageSurahs == null && !loadingPackage) {
                await _loadPackageSurahs();
              } else {
                setState(() => packageSurahs = null);
              }
            },
            icon: Icon(usePackage ? Icons.cloud_download : Icons.storage),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7F5EE), Color(0xFFF3F7F4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF0C6B4E)),
                  hintText: 'Rechercher une sourate',
                  hintStyle: GoogleFonts.poppins(color: Colors.grey.shade600),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  children: [
                    Text(
                      'Traduction : ',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF183729),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedTranslation,
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(value: 'Tout', child: Text('Tout')),
                            DropdownMenuItem(value: 'Français', child: Text('Français')),
                            DropdownMenuItem(value: 'Swahili', child: Text('Swahili')),
                            DropdownMenuItem(value: 'Arabe', child: Text('Arabe')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => _selectedTranslation = value);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: Text(
                        _showOnlyFavorites ? 'Favoris actifs' : 'Afficher les favoris',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                      selected: _showOnlyFavorites,
                      selectedColor: const Color(0xFF0C6B4E).withValues(alpha: 0.12),
                      labelStyle: GoogleFonts.poppins(
                        color: const Color(0xFF0C6B4E),
                      ),
                      onSelected: (_) => setState(() => _showOnlyFavorites = !_showOnlyFavorites),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredSurah.length,
                  itemBuilder: (context, index) {
                    final surah = filteredSurah[index];
                    final isFavorite = _favoriteSurahIds.contains(surah.number.toString());
                    return Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.black.withValues(alpha: 0.04)),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        leading: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0C6B4E).withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Text(
                              '${surah.number}',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF0C6B4E),
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          surah.englishName,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: const Color(0xFF173C2A),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              surah.arabicName,
                              style: GoogleFonts.amiri(
                                fontSize: 22,
                                color: const Color(0xFF0C6B4E),
                              ),
                            ),
                            Text(
                              '${surah.verseCount} versets • ${surah.frenchName}',
                              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: const Color(0xFF0C6B4E),
                                size: 24,
                              ),
                              onPressed: () => _toggleFavorite(surah.number.toString()),
                            ),
                            const Icon(Icons.chevron_right_rounded, color: Color(0xFF0C6B4E)),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SurahCatalogView(
                                surah: surah,
                                selectedTranslation: _selectedTranslation,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SurahCatalogView extends StatelessWidget {
  final QuranCatalogItem surah;
  final String selectedTranslation;

  const SurahCatalogView({
    super.key,
    required this.surah,
    required this.selectedTranslation,
  });

  @override
  Widget build(BuildContext context) {
    final preview = [
      'بِسْمِ ٱللّٰهِ ٱلرَّحْمٰنِ ٱلرَّحِيمِ',
      'ٱلْحَمْدُ لِلّٰهِ رَبِّ ٱلْعٰلَمِين',
      'ٱلرَّحْمٰنِ ٱلرَّحِيمِ',
      'مَٰلِكِ يَوْمِ ٱلدِّينِ',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${surah.number}. ${surah.englishName}',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          try {
            await SurahAudioController.instance.playSurah(surahNumber: surah.number);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lecture en cours'), behavior: SnackBarBehavior.floating));
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur lecture audio: $e')));
          }
        },
        icon: const Icon(Icons.play_arrow_rounded),
        label: const Text('Lecture'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7F5EE), Color(0xFFF3F7F4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0C6B4E), Color(0xFF1B7F5F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.arabicName,
                    style: GoogleFonts.amiri(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${surah.englishName} • ${surah.verseCount} versets',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    surah.description,
                    style: GoogleFonts.poppins(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: preview.length,
                itemBuilder: (context, index) {
                  final verified = preview[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.black.withValues(alpha: 0.03)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD7B45C).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'Verset ${index + 1}',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF0C6B4E),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (selectedTranslation == 'Tout' || selectedTranslation == 'Arabe')
                          Text(
                            verified,
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.amiri(
                              fontSize: 24,
                              height: 1.8,
                              color: const Color(0xFF183729),
                            ),
                          ),
                        const SizedBox(height: 10),
                        if (selectedTranslation == 'Tout' || selectedTranslation == 'Français')
                          Text(
                            'Français : ${surah.frenchName}',
                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
                          ),
                        if ((selectedTranslation == 'Tout' || selectedTranslation == 'Swahili') && index == 0)
                          Text(
                            'Swahili : ${surah.description}',
                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SurahView extends StatelessWidget {
  final SurahData surah;
  final String selectedTranslation;

  const SurahView({
    super.key,
    required this.surah,
    required this.selectedTranslation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${surah.number}. ${surah.englishName}',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Lecture de démonstration activée'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        icon: const Icon(Icons.play_arrow_rounded),
        label: const Text('Lecture'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7F5EE), Color(0xFFF3F7F4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0C6B4E), Color(0xFF1B7F5F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.arabicName,
                    style: GoogleFonts.amiri(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${surah.englishName} • ${surah.verses.length} versets',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: surah.verses.length,
                itemBuilder: (context, index) {
                  final verse = surah.verses[index];
                  final displayFr = selectedTranslation == 'Français' || selectedTranslation == 'Tout';
                  final displaySw = selectedTranslation == 'Swahili' || selectedTranslation == 'Tout';
                  final displayAr = selectedTranslation == 'Arabe' || selectedTranslation == 'Tout';

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.black.withValues(alpha: 0.03)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD7B45C).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'Verset ${verse.number}',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF0C6B4E),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (displayAr)
                          Text(
                            verse.arabic,
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.amiri(
                              fontSize: 24,
                              height: 1.8,
                              color: const Color(0xFF183729),
                            ),
                          ),
                        const SizedBox(height: 10),
                        if (displayFr)
                          Text(
                            'Français : ${verse.translations['fr'] ?? '—'}',
                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
                          ),
                        if (displayFr && displaySw) const SizedBox(height: 6),
                        if (displaySw)
                          Text(
                            'Swahili : ${verse.translations['sw'] ?? '—'}',
                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
