import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../data/channels_data.dart';
import '../services/youtube_service.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  final Map<String, String?> _liveVideoIds = {};

  @override
  void initState() {
    super.initState();
    _checkAllLives();
  }

  Future<void> _checkAllLives() async {
    for (final channel in channelsList) {
      final videoId = await YoutubeService.getLiveVideoId(channel.channelId);
      if (!mounted) return;
      setState(() {
        _liveVideoIds[channel.handle] = videoId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📡 TV Islamique'),
        backgroundColor: const Color(0xFF0C6B4E),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: channelsList.length,
        itemBuilder: (context, index) {
          final channel = channelsList[index];
          final videoId = _liveVideoIds[channel.handle];
          final isLive = videoId != null && videoId.isNotEmpty;

          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isLive ? Colors.red : Colors.grey,
                child: Text(
                  isLive ? 'L' : '⚪',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                channel.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${channel.category} • ${channel.language}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              trailing: isLive
                  ? const Icon(Icons.play_circle, color: Colors.red)
                  : const Icon(Icons.circle, color: Colors.grey),
              onTap: () {
                if (videoId == null || videoId.isEmpty) return;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      appBar: AppBar(
                        title: Text(channel.name),
                        backgroundColor: const Color(0xFF0C6B4E),
                        foregroundColor: Colors.white,
                      ),
                      body: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: videoId,
                          flags: const YoutubePlayerFlags(
                            autoPlay: true,
                            isLive: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}