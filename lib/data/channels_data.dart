import '../models/channel_model.dart';

List<ChannelModel> channelsList = [
  // 🔴 PRIORITÉ 1 – Flux en direct (Live)
  ChannelModel(
    name: 'Ar Rahman – Makkah & Madina Live 24/7',
    handle: '@arrahmanislamic',
    channelId: 'UCWainKMJPyXikjekccFf3NA',
    category: 'Live',
    language: 'Arabe',
  ),
  ChannelModel(
    name: 'Muhammad Ali – Makkah Live HD',
    handle: '@muhammad_ali',
    channelId: 'UC_qJhakG5LqYgVDxIhM0hew',
    category: 'Live',
    language: 'Arabe',
  ),
  ChannelModel(
    name: 'Al-Aqsa Live',
    handle: '@livebroadcastal-aqsa3717',
    channelId: 'UC2l1w7FCuff2-h429sAUSXQ',
    category: 'Live',
    language: 'Arabe',
  ),

  // 🟡 PRIORITÉ 2 – Récitations et éducation
  ChannelModel(
    name: 'AlQuran4K – Coran 4K',
    handle: '@alquran4kofficial',
    channelId: 'UCfBw_uwZb_oFLyVsjWk6owQ',
    category: 'Récitations',
    language: 'International',
  ),
  ChannelModel(
    name: 'Ammar TV – Récitations indonésiennes',
    handle: '@ammartv',
    channelId: 'UCHDSDQfeGL5yepLg3niOhDA',
    category: 'Récitations',
    language: 'Indonésien',
  ),
  ChannelModel(
    name: 'Radiotélévision Al Bayane',
    handle: '@radiotvalbayane',
    channelId: 'UCIby2pzNJkvQsbc38shuGTw',
    category: 'Télévision islamique',
    language: 'Français',
  ),

  // 🟢 PRIORITÉ 3 – Débats et prédications (Swahili)
  ChannelModel(
    name: 'DUG TV1 🇨🇩 – Débats musulmans-chrétiens',
    handle: '@miskiyaroho',
    channelId: 'UCKa3O0269bu_csiCjmObxhQ',
    category: 'Débats',
    language: 'Lingala / Swahili',
  ),
  ChannelModel(
    name: 'AlhudaTv Kenya',
    handle: '@alhudatvkenya',
    channelId: 'UCdTAsRrQEp-IVoMzKoRG4ZQ',
    category: 'Télévision islamique',
    language: 'Swahili / Anglais',
  ),
  ChannelModel(
    name: 'Saifullah-Saleh – Débats et sermons',
    handle: '@saifullah-saleh',
    channelId: 'UCeJ5G4kevNcGPvLDN5NTM-Q',
    category: 'Débats',
    language: 'Swahili',
  ),
];