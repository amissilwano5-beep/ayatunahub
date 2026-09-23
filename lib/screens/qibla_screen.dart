import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import '../services/location_service.dart';
import '../services/qibla_service.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double _qiblaAngle = 0.0;
  double _deviceHeading = 0.0;
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _initQibla();
  }

  Future<void> _initQibla() async {
    setState(() => _isLoading = true);

    // Récupérer la position GPS
    final position = await LocationService.getCurrentPosition();
    if (position == null) {
      setState(() {
        _errorMessage = 'Impossible d\'obtenir votre position. Vérifiez le GPS.';
        _isLoading = false;
      });
      return;
    }

    // Calculer la Qibla
    final angle = QiblaService.calculateQiblaAngle(
      position.latitude,
      position.longitude,
    );
    setState(() {
      _qiblaAngle = angle;
      _isLoading = false;
    });

    // Écouter la boussole
    FlutterCompass.events?.listen((event) {
      setState(() {
        _deviceHeading = event.heading ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🕋 Direction de la Qibla'),
        backgroundColor: const Color(0xFF0C6B4E),
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : _buildQiblaCompass(),
    );
  }

  Widget _buildQiblaCompass() {
    // Calcul du décalage entre le nord de l'appareil et la Qibla
    double qiblaOffset = (_qiblaAngle - _deviceHeading + 360) % 360;
    String cardinal = QiblaService.getCardinalDirection(qiblaOffset);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Flèche / Boussole
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 2),
            ),
            child: Transform.rotate(
              angle: qiblaOffset * pi / 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Flèche vers le haut (Nord)
                  Icon(
                    Icons.arrow_upward,
                    color: Colors.red,
                    size: 60,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '🕋 Qibla',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Angle: ${qiblaOffset.toStringAsFixed(1)}°',
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Direction cardinale
          Text(
            'Direction: $cardinal',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0C6B4E),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Nord de l\'appareil: ${_deviceHeading.toStringAsFixed(1)}°',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 20),

          // Bouton de rafraîchissement
          ElevatedButton(
            onPressed: _initQibla,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0C6B4E),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: const Text(
              '🔄 Recentrer',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}