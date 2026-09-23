import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/calendar_page.dart';
import '../pages/home_page.dart';
import '../pages/prayer_page.dart';
import '../services/firebase/auth.dart';
import 'live_screen.dart';
import 'map_screen.dart';
import 'qibla_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.isAdmin = false});

  final bool isAdmin;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    HomePage(),
    PrayerPage(),
    QiblaScreen(),
    CalendarPage(),
    LiveScreen(),
    MapScreen(),
  ];

  Future<void> _signOut() async {
    await AppAuth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isAdmin ? 'AyatunaHub Admin' : 'AyatunaHub',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color(0xFF0C6B4E),
        foregroundColor: Colors.white,
        actions: [
          if (widget.isAdmin)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Chip(
                label: Text(
                  'Admin',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                backgroundColor: Colors.white,
                side: BorderSide.none,
              ),
            ),
          IconButton(
            onPressed: _signOut,
            tooltip: 'Déconnexion',
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0C6B4E),
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.mosque_rounded), label: 'Prière'),
          BottomNavigationBarItem(icon: Icon(Icons.explore_rounded), label: 'Qibla'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_rounded), label: 'Calendrier'),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv_rounded), label: 'Live'),
          BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: 'Carte'),
        ],
      ),
    );
  }
}