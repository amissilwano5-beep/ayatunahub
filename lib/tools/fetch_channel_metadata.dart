// Récupère les métadonnées YouTube pour des channelIds fournis en arguments.
// Usage:
// dart run lib/tools/fetch_channel_metadata.dart <channelId1> <channelId2> ...

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

final youtubeChannelsUrl = 'https://www.googleapis.com/youtube/v3/channels';

Future<Map<String, dynamic>?> fetchChannel(String apiKey, String channelId) async {
  final uri = Uri.parse('$youtubeChannelsUrl?part=snippet,statistics,brandingSettings&id=${Uri.encodeComponent(channelId)}&key=$apiKey');
  final res = await http.get(uri);
  if (res.statusCode != 200) {
    stderr.writeln('Erreur API (${res.statusCode}) pour $channelId: ${res.body}');
    return null;
  }
  final data = jsonDecode(res.body) as Map<String, dynamic>;
  final items = data['items'] as List<dynamic>?;
  if (items == null || items.isEmpty) return null;
  return items[0] as Map<String, dynamic>;
}

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: dart run lib/tools/fetch_channel_metadata.dart <channelId1> <channelId2> ...');
    exit(1);
  }

  final envFile = File('${Directory.current.path}/env.json');
  if (!await envFile.exists()) {
    stderr.writeln('env.json introuvable. Créez-le à partir de env.json.example contenant YOUTUBE_API_KEY.');
    exit(1);
  }
  final env = jsonDecode(await envFile.readAsString()) as Map<String, dynamic>;
  final apiKey = env['YOUTUBE_API_KEY'] as String?;
  if (apiKey == null || apiKey.isEmpty) {
    stderr.writeln('YOUTUBE_API_KEY manquante dans env.json.');
    exit(1);
  }

  for (final id in args) {
    stdout.writeln('\n--- ChannelId: $id ---');
    final item = await fetchChannel(apiKey, id);
    if (item == null) {
      stdout.writeln('Aucune donnée pour $id');
      continue;
    }
    final snippet = item['snippet'] as Map<String, dynamic>?;
    final stats = item['statistics'] as Map<String, dynamic>?;
    final branding = item['brandingSettings'] as Map<String, dynamic>?;
    final description = snippet?['description'] as String? ?? '';

    final title = snippet?['title'] ?? '<no title>';
    final customUrl = snippet?['customUrl'];
    final country = snippet?['country'];
    final publishedAt = snippet?['publishedAt'];
    final subscriberCount = stats?['subscriberCount'];
    final viewCount = stats?['viewCount'];

    stdout.writeln('Title: $title');
    if (customUrl != null) stdout.writeln('Custom URL: $customUrl');
    if (publishedAt != null) stdout.writeln('PublishedAt: $publishedAt');
    if (country != null) stdout.writeln('Country: $country');
    if (branding != null) stdout.writeln('Branding settings: available');
    if (description.isNotEmpty) {
      final preview = description.length > 120
          ? '${description.substring(0, 120)}...'
          : description;
      stdout.writeln('Description: $preview');
    }
    stdout.writeln('Subscribers: ${subscriberCount ?? 'n/a'}');
    stdout.writeln('Views: ${viewCount ?? 'n/a'}');
    final thumbnails = snippet?['thumbnails'] as Map<String, dynamic>?;
    if (thumbnails != null) {
      final thumb = thumbnails['default'] ?? thumbnails.values.first;
      stdout.writeln('Thumbnail: ${thumb?['url']}');
    }

    final channelUrl = 'https://www.youtube.com/channel/$id';
    stdout.writeln('URL: $channelUrl');

    // small delay
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
