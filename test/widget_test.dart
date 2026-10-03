import 'package:ayatunahub/pages/hadiths_page.dart';
import 'package:ayatunahub/pages/home_page.dart';
import 'package:ayatunahub/pages/quran_page.dart';
import 'package:ayatunahub/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ayatunahub/main.dart';

void main() {
  testWidgets('L’application affiche la page d’accueil', (WidgetTester tester) async {
    await tester.pumpWidget(const AyatunaHubApp());

    expect(find.text('AyatunaHub'), findsWidgets);
    expect(find.text('Lire le Coran'), findsOneWidget);
  });

  testWidgets('l’écran de connexion s’affiche au lancement', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AuthScreen()));

    expect(find.text('Connexion'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);
  });

  testWidgets('la page des hadiths affiche le module Dhikr & Dorah', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HadithsPage()));

    expect(find.text('40 Hadiths d’Imam Al-Nawawi'), findsOneWidget);
    expect(find.text('Dikr & Dorah du jour'), findsOneWidget);
    expect(find.textContaining('Bismillahi'), findsOneWidget);
  });

  testWidgets('la navigation depuis l’accueil ouvre le module hadiths', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    expect(find.text('40 Hadiths'), findsOneWidget);

    await tester.tap(find.text('40 Hadiths'));
    await tester.pumpAndSettle();

    expect(find.byType(HadithsPage), findsOneWidget);
    expect(find.text('40 Hadiths d’Imam Al-Nawawi'), findsOneWidget);
  });

  testWidgets('la navigation depuis l’accueil ouvre le coran', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    await tester.tap(find.text('Lire le Coran'));
    await tester.pumpAndSettle();

    expect(find.byType(QuranPage), findsOneWidget);
  });
}
