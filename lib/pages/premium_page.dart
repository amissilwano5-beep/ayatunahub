import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/premium_service.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  String _currentPlan = 'free';
  bool _isPremium = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadStatus();
  }

  Future<void> _loadStatus() async {
    final premium = await PremiumService.isPremium();
    final plan = await PremiumService.getPlan();
    setState(() {
      _isPremium = premium;
      _currentPlan = plan;
      _loading = false;
    });
  }

  Future<void> _activatePlan(String plan) async {
    await PremiumService.setPlan(plan);
    final premium = await PremiumService.isPremium();
    setState(() {
      _isPremium = premium;
      _currentPlan = plan;
    });
  }

  Future<void> _activateTrial() async {
    await PremiumService.activateTrial();
    setState(() {
      _currentPlan = 'trial';
      _isPremium = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final plans = [
      _PlanCard(
        title: 'Gratuit',
        price: '0 FC',
        description: 'Coran, hadiths de base, prières, Qibla, calendrier et publicités.',
        accent: const Color(0xFF0C6B4E),
        tag: _currentPlan == 'free' ? 'Actif' : 'Choisir',
        onTap: () => _activatePlan('free'),
      ),
      _PlanCard(
        title: 'Essai 32h',
        price: '0 FC',
        description: 'Accès complet à toutes les fonctionnalités pendant 32 heures.',
        accent: const Color(0xFFD7B45C),
        tag: _currentPlan == 'trial' ? 'Essai actif' : 'Tester',
        onTap: _activateTrial,
      ),
      _PlanCard(
        title: '1 mois',
        price: '10 \$',
        description: 'Accès premium complet pendant 1 mois.',
        accent: const Color(0xFF1E5339),
        tag: _currentPlan == 'month_1' ? 'Actif' : 'Choisir',
        onTap: () => _activatePlan('month_1'),
      ),
      _PlanCard(
        title: '2 mois',
        price: '20 \$',
        description: 'Accès premium complet pour 2 mois.',
        accent: const Color(0xFF193B7A),
        tag: _currentPlan == 'month_2' ? 'Actif' : 'Choisir',
        onTap: () => _activatePlan('month_2'),
      ),
      _PlanCard(
        title: '1 an',
        price: '50 \$',
        description: 'Accès premium complet pour 1 an.',
        accent: const Color(0xFF7A4F00),
        tag: _currentPlan == 'year_1' ? 'Actif' : 'Choisir',
        onTap: () => _activatePlan('year_1'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Abonnements',
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
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: _isPremium ? const Color(0xFF0C6B4E) : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(
                            _isPremium ? 'Statut : Premium actif' : 'Statut : version gratuite',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: _isPremium ? Colors.white : const Color(0xFF183729),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Choisissez votre accès',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF183729),
                    ),
                  ),
                  const SizedBox(height: 14),
                  ...plans.map((plan) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: plan.buildCard(),
                      )),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black.withValues(alpha: 0.04)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Moyens de paiement acceptés',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF183729),
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '• Carte bancaire / virement (à intégrer plus tard)\n• Afri Money : +243902068175\n• Airtel Money, Orange Money, MTN Money (numéros à ajouter plus tard)',
                          style: GoogleFonts.poppins(
                            height: 1.7,
                            fontSize: 13,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _PlanCard {
  final String title;
  final String price;
  final String description;
  final Color accent;
  final String tag;
  final Future<void> Function() onTap;

  const _PlanCard({
    required this.title,
    required this.price,
    required this.description,
    required this.accent,
    required this.tag,
    required this.onTap,
  });

  Widget buildCard() {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.black.withValues(alpha: 0.04)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: accent,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      tag,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF0C6B4E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      height: 1.7,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
