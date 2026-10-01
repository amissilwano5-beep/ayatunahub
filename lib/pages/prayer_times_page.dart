import 'package:flutter/material.dart';
import '../services/prayer_service.dart';

class PrayerTimesPage extends StatefulWidget {
  const PrayerTimesPage({super.key});

  @override
  State<PrayerTimesPage> createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  Map<String, dynamic>? _times;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadTimes();
  }

  Future<void> _loadTimes() async {
    final times = await PrayerService.getPrayerTimesForCurrentLocation();
    setState(() {
      _times = times;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Heures de prière')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                ListTile(title: const Text('Fajr'), subtitle: Text(_times!['fajr'].toString())),
                ListTile(title: const Text('Dhuhr'), subtitle: Text(_times!['dhuhr'].toString())),
                ListTile(title: const Text('Asr'), subtitle: Text(_times!['asr'].toString())),
                ListTile(title: const Text('Maghrib'), subtitle: Text(_times!['maghrib'].toString())),
                ListTile(title: const Text('Isha'), subtitle: Text(_times!['isha'].toString())),
                ListTile(title: const Text('Latitude'), subtitle: Text(_times!['latitude'].toString())),
                ListTile(title: const Text('Longitude'), subtitle: Text(_times!['longitude'].toString())),
              ],
            ),
    );
  }
}
