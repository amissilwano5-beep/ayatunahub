import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calendar_page.dart';
import 'about_page.dart';
import 'favorites_page.dart';
import 'hadiths_page.dart';
import 'learn_page.dart';
import 'premium_page.dart';
import 'prayer_page.dart';
import 'prophets_page.dart';
import 'quran_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      _StatItem(label: 'Sourates', value: '114', icon: Icons.menu_book_rounded),
      _StatItem(label: 'Livres', value: '688+', icon: Icons.library_books_rounded),
      _StatItem(label: 'Piliers', value: '5', icon: Icons.mosque_rounded),
      _StatItem(label: 'Prophètes', value: '6+', icon: Icons.timeline_rounded),
    ];

    final menu = [
      _HomeAction(
        title: 'Lire le Coran',
        subtitle: 'Sourates • Riwâya • Traductions',
        icon: Icons.menu_book_rounded,
        color: const Color(0xFF0C6B4E),
        page: const QuranPage(),
      ),
      _HomeAction(
        title: 'Prière & Qibla',
        subtitle: 'Horaires • Directions • Suivi',
        icon: Icons.mosque_rounded,
        color: const Color(0xFFAF8E3F),
        page: const PrayerPage(),
      ),
      _HomeAction(
        title: '40 Hadiths',
        subtitle: 'Dorar • 688+ livres • dorah',
        icon: Icons.format_quote_rounded,
        color: const Color(0xFFAF8E3F),
        page: const HadithsPage(),
      ),
      _HomeAction(
        title: 'Savoir plus',
        subtitle: 'Ablutions • Prière • Piliers',
        icon: Icons.self_improvement_rounded,
        color: const Color(0xFF1E5339),
        page: const LearnPage(),
      ),
      _HomeAction(
        title: 'Calendrier',
        subtitle: 'Date grégorienne • Hégirienne',
        icon: Icons.calendar_month_rounded,
        color: const Color(0xFF7A4F00),
        page: const CalendarPage(),
      ),
      _HomeAction(
        title: 'Prophètes',
        subtitle: 'Histoire et enseignement',
        icon: Icons.timeline_rounded,
        color: const Color(0xFFB89A3A),
        page: const ProphetsPage(),
      ),
      _HomeAction(
        title: 'Premium',
        subtitle: 'Gratuit • module • premium',
        icon: Icons.workspace_premium_rounded,
        color: const Color(0xFF0C6B4E),
        page: const PremiumPage(),
      ),
      _HomeAction(
        title: 'Favoris',
        subtitle: 'Vos sourates et hadiths préférés',
        icon: Icons.favorite_rounded,
        color: const Color(0xFFD50032),
        page: const FavoritesPage(),
      ),
    ];

    final drawerItems = [
      _DrawerItem(label: 'Accueil', icon: Icons.home_rounded, page: const HomePage()),
      _DrawerItem(label: 'Lire le Coran', icon: Icons.menu_book_rounded, page: const QuranPage()),
      _DrawerItem(label: 'Prière & Qibla', icon: Icons.mosque_rounded, page: const PrayerPage()),
      _DrawerItem(label: 'Hadiths', icon: Icons.format_quote_rounded, page: const HadithsPage()),
      _DrawerItem(label: 'Calendrier', icon: Icons.calendar_month_rounded, page: const CalendarPage()),
      _DrawerItem(label: 'Apprendre', icon: Icons.school_rounded, page: const LearnPage()),
      _DrawerItem(label: 'Prophètes', icon: Icons.auto_stories_rounded, page: const ProphetsPage()),
      _DrawerItem(label: 'Premium', icon: Icons.workspace_premium_rounded, page: const PremiumPage()),
      _DrawerItem(label: 'Favoris', icon: Icons.favorite_rounded, page: const FavoritesPage()),
      _DrawerItem(label: 'À propos', icon: Icons.info_rounded, page: const AboutPage()),
    ];

    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0C6B4E), Color(0xFF1B7F5F)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.mosque_rounded, size: 34, color: Color(0xFF0C6B4E)),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'AyatunaHub',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Coran, Hadiths & Prières',
                      style: GoogleFonts.poppins(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: drawerItems.map((item) {
                    return ListTile(
                      leading: Icon(item.icon, color: const Color(0xFF0C6B4E)),
                      title: Text(
                        item.label,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => item.page),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'AyatunaHub',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF6F1DF), Color(0xFFF9F8F3)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0C6B4E).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      'AyatunaHub',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0C6B4E),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF0C6B4E), Color(0xFF1B7F5F), Color(0xFFD7B45C)],
                    ),
                    borderRadius: BorderRadius.circular(26),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0C6B4E).withValues(alpha: 0.2),
                        blurRadius: 18,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.mosque_rounded, size: 42, color: Colors.white),
                      const SizedBox(height: 14),
                      Text(
                        'AyatunaHub',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Coran • Hadiths • Prières • Connaissances',
                        style: GoogleFonts.poppins(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Base Dorar Hadith : 688+ livres, références authentiques et dorah inspirante.',
                        style: GoogleFonts.poppins(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          'Coran, Hadiths & Prières',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 86,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stats.length,
                    itemBuilder: (context, index) {
                      final item = stats[index];
                      return Container(
                        width: 112,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(item.icon, size: 18, color: const Color(0xFF0C6B4E)),
                            const SizedBox(height: 8),
                            Text(
                              item.value,
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF183729),
                              ),
                            ),
                            Text(
                              item.label,
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Menu principal',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF183729),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    itemCount: menu.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: 0.92,
                    ),
                    itemBuilder: (context, index) {
                      final action = menu[index];
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(22),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => action.page),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: Colors.black.withValues(alpha: 0.04)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.04),
                                  blurRadius: 10,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: action.color.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Icon(action.icon, color: action.color, size: 28),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  action.title,
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF1C2C24),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  action.subtitle,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DrawerItem {
  final String label;
  final IconData icon;
  final Widget page;

  const _DrawerItem({
    required this.label,
    required this.icon,
    required this.page,
  });
}

class _StatItem {
  final String label;
  final String value;
  final IconData icon;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
  });
}

class _HomeAction {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget page;

  const _HomeAction({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.page,
  });
}
