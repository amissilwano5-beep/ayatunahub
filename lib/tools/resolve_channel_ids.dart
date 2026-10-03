// ignore_for_file: avoid_print

// Script Dart pour résoudre des handles YouTube (@handle) en channelId
// Usage:
// 1) Créez un fichier `env.json` à la racine contenant votre clé (ne pas commiter):
//    { "YOUTUBE_API_KEY": "AIza..." }
// 2) Exécutez:
//    dart run lib/tools/resolve_channel_ids.dart
// Le script lira `lib/data/channels_data.dart`, extraira les handles et
// affichera pour chaque handle le channelId trouvé via l'API YouTube Data v3.

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

final youtubeSearchUrl = 'https://www.googleapis.com/youtube/v3/search';

Future<String?> resolveHandle(String apiKey, String handle) async {
  final query = Uri.parse('$youtubeSearchUrl?part=snippet&type=channel&maxResults=1&q=${Uri.encodeQueryComponent(handle)}&key=$apiKey');
  final res = await http.get(query);
  if (res.statusCode != 200) return null;
  final data = jsonDecode(res.body) as Map<String, dynamic>;
  final items = data['items'] as List<dynamic>?;
  if (items == null || items.isEmpty) return null;
  final id = items[0]['id'] as Map<String, dynamic>?;
  return id == null ? null : id['channelId'] as String?;
}

Future<void> main() async {
  final projectRoot = Directory.current.path;

  // Lire env.json local
  final envFile = File('$projectRoot/env.json');
  if (!await envFile.exists()) {
    stderr.writeln('Fichier env.json introuvable dans $projectRoot. Créez-le à partir de env.json.example et ajoutez votre clé.');
    exit(1);
  }
  final env = jsonDecode(await envFile.readAsString()) as Map<String, dynamic>;
  final apiKey = env['YOUTUBE_API_KEY'] as String?;
  if (apiKey == null || apiKey.isEmpty) {
    stderr.writeln('YOUTUBE_API_KEY manquante dans env.json.');
    exit(1);
  }

  // Lire channels_data.dart
  final channelsFile = File('$projectRoot/lib/data/channels_data.dart');
  if (!await channelsFile.exists()) {
    stderr.writeln('Fichier lib/data/channels_data.dart introuvable.');
    exit(1);
  }
  final content = await channelsFile.readAsString();

  final handleRegex = RegExp(r"handle:\s*'(@[A-Za-z0-9_\.-]+)'", multiLine: true);
  final matches = handleRegex.allMatches(content).toList();
  if (matches.isEmpty) {
    print('Aucun handle trouvé dans lib/data/channels_data.dart.');
    exit(0);
  }

  print('Résolution des handles (${matches.length}) — cela utilise l\'API YouTube Data v3');

  final results = <String, String?>{};
  for (final m in matches) {
    final handle = m.group(1)!; // ex: @arrahmanislamic
    final cleaned = handle.replaceFirst('@', '');
    stdout.write('Resolving $handle ... ');
    try {
      final channelId = await resolveHandle(apiKey, cleaned);
      results[handle] = channelId;
      print(channelId ?? 'NOT FOUND');
    } catch (_) {
      results[handle] = null;
      print('ERROR');
    }
    // courte pause pour éviter throttling
    await Future.delayed(const Duration(milliseconds: 200));
  }

  print('\nRésultats (handle -> channelId):');
  for (final entry in results.entries) {
    print('${entry.key} -> ${entry.value ?? '<not found>'}');
  }

  print('\nRemarque: le script n\'écrit pas automatiquement dans `channels_data.dart`.');
  print('Copiez manuellement les channelId retournés dans `lib/data/channels_data.dart` ou me demandez de l\'appliquer.');
}
