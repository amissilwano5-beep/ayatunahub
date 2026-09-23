class ChannelModel {
  final String name;
  final String handle;
  final String channelId;
  final String category;
  final String language;
  final bool isLive;

  ChannelModel({
    required this.name,
    required this.handle,
    required this.channelId,
    required this.category,
    required this.language,
    this.isLive = false,
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) {
    return ChannelModel(
      name: json['name'] ?? '',
      handle: json['handle'] ?? '',
      channelId: json['channelId'] ?? '',
      category: json['category'] ?? '',
      language: json['language'] ?? '',
      isLive: json['isLive'] ?? false,
    );
  }
}