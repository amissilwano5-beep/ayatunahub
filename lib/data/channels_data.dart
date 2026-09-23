import '../models/channel_model.dart';

List<ChannelModel> channelsList = [
  // 🔴 PRIORITÉ 1 – Flux en direct (Live)
  ChannelModel(
    name: 'Ar Rahman – Makkah & Madina Live 24/7',
    handle: '@arrahmanislamic',
    channelId: 'UC0k8TjrY1j8iNtV4y1qW4XQ',
    category: 'Live',
    language: 'Arabe',
  ),
  ChannelModel(
    name: 'Muhammad Ali – Makkah Live HD',
    handle: '@muhammad_ali',
    channelId: 'UCnXpQqGdX1Z2Q_lqV3XjFYA',
    category: 'Live',
    language: 'Arabe',
  ),
  ChannelModel(
    name: 'Al-Aqsa Live',
    handle: '@livebroadcastal-aqsa3717',
    channelId: 'UC0Z8j5Y9W1zX5jKpYlKQyFw',
    category: 'Live',
    language: 'Arabe',
  ),

  // 🟡 PRIORITÉ 2 – Récitations et éducation
  ChannelModel(
    name: 'AlQuran4K – Coran 4K',
    handle: '@alquran4kofficial',
    channelId: 'UC3rVjM9xY7TqzvJbWQc4YWw',
    category: 'Récitations',
    language: 'International',
  ),
  ChannelModel(
    name: 'Ammar TV – Récitations indonésiennes',
    handle: '@ammartv',
    channelId: 'UC0Qk7XZ3pJkL8vVkZvPq5Ew',
    category: 'Récitations',
    language: 'Indonésien',
  ),
  ChannelModel(
    name: 'Radiotélévision Al Bayane',
    handle: '@radiotvalbayane',
    channelId: 'UCYzZ3jP0XkQx7zPjWlVp9IA',
    category: 'Télévision islamique',
    language: 'Français',
  ),

  // 🟢 PRIORITÉ 3 – Débats et prédications (Swahili)
  ChannelModel(
    name: 'DUG TV1 🇨🇩 – Débats musulmans-chrétiens',
    handle: '@miskiyaroho',
    channelId: 'UCYzZ3jP0XkQx7zPjWlVp9IA',
    category: 'Débats',
    language: 'Lingala / Swahili',
  ),
  ChannelModel(
    name: 'AlhudaTv Kenya',
    handle: '@alhudatvkenya',
    channelId: 'UCYzZ3jP0XkQx7zPjWlVp9IA',
    category: 'Télévision islamique',
    language: 'Swahili / Anglais',
  ),
  ChannelModel(
    name: 'Saifullah-Saleh – Débats et sermons',
    handle: '@saifullah-saleh',
    channelId: 'UCYzZ3jP0XkQx7zPjWlVp9IA',
    category: 'Débats',
    language: 'Swahili',
  ),
];