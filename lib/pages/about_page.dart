import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      'Lecture du Coran avec traduction et recitations',
      'Hadiths authentifies et classes par source',
      'Horaires de priere, Qibla et calendrier hegirien',
      'Favoris, rappels, contenu educatif et modules premium',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'A propos',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF7F5EE), Color(0xFFF3F7F4)],
          ),
        ),
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AyatunaHub',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF0C6B4E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Coran, Hadiths & Prieres',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: const Color(0xFF1E5339),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'AyatunaHub est une application islamique pensee pour les francophones d Afrique. Elle vise a rassembler le Coran, les hadiths, les prieres, l education islamique et les outils pratiques dans un seul espace serieux et accessible.',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        height: 1.7,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Ce que propose la V1',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF183729),
              ),
            ),
            const SizedBox(height: 12),
            ...features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle_rounded, color: Color(0xFF0C6B4E)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        feature,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          height: 1.5,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: const Color(0xFF0C6B4E),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Modele de monetisation',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Gratuit : Coran, hadiths de base, horaires, Qibla et live avec publicites.\nDeblocage d'un module : 2,5 \$ / 2 mois.\nPremium : 20 \$ / 2 mois ou 50 \$ / 1 an.",
                      style: GoogleFonts.poppins(
                        color: Colors.white.withValues(alpha: 0.95),
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
