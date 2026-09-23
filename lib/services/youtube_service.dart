import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class YoutubeService {
  static final String apiKey = dotenv.env['YOUTUBE_API_KEY'] ?? '';

  static Future<String?> getChannelId(String handle) async {
    if (apiKey.isEmpty) {
      return null;
    }

    final url = Uri.parse(
      'https://www.googleapis.com/youtube/v3/search'
      '?part=snippet&q=${Uri.encodeQueryComponent(handle)}&type=channel&key=$apiKey',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['items'] != null && data['items'].isNotEmpty) {
        return data['items'][0]['id']['channelId'];
      }
    }
    return null;
  }

  static Future<String?> getLiveVideoId(String channelId) async {
    if (apiKey.isEmpty) {
      return 'dQw4w9WgXcQ';
    }

    final url = Uri.parse(
      'https://www.googleapis.com/youtube/v3/search'
      '?part=snippet&channelId=$channelId&eventType=live&type=video&key=$apiKey',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['items'] != null && data['items'].isNotEmpty) {
        return data['items'][0]['id']['videoId'];
      }
    }
    return null;
  }
}
