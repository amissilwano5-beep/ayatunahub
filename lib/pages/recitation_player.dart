import 'package:flutter/material.dart';
import '../services/audio_service.dart';
import '../data/recitations_data.dart';

class RecitationPlayerPage extends StatefulWidget {
  const RecitationPlayerPage({super.key});

  @override
  State<RecitationPlayerPage> createState() => _RecitationPlayerPageState();
}

class _RecitationPlayerPageState extends State<RecitationPlayerPage> {
  final AudioService _audioService = AudioService();
  int _currentIndex = 0;

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  Future<void> _playIndex(int index) async {
    final r = sampleRecitations[index];
    await _audioService.setUrl(r.url);
    await _audioService.play();
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final r = sampleRecitations[_currentIndex];
    return Scaffold(
      appBar: AppBar(title: const Text('Lecteur de récitations')),
      body: Column(
        children: [
          ListTile(
            title: Text(r.title),
            subtitle: Text(r.narrator),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: _currentIndex > 0 ? () => _playIndex(_currentIndex - 1) : null,
              ),
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () => _playIndex(_currentIndex),
              ),
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () => _audioService.pause(),
              ),
              IconButton(
                icon: const Icon(Icons.stop),
                onPressed: () => _audioService.stop(),
              ),
              IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: _currentIndex < sampleRecitations.length - 1 ? () => _playIndex(_currentIndex + 1) : null,
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: sampleRecitations.length,
              itemBuilder: (c, i) {
                final s = sampleRecitations[i];
                return ListTile(
                  title: Text(s.title),
                  subtitle: Text(s.narrator),
                  selected: i == _currentIndex,
                  onTap: () => _playIndex(i),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
