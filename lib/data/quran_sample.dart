class VerseData {
  final int number;
  final String arabic;
  final Map<String, String> translations;

  const VerseData({
    required this.number,
    required this.arabic,
    required this.translations,
  });
}

class SurahData {
  final int number;
  final String englishName;
  final String arabicName;
  final List<VerseData> verses;

  const SurahData({
    required this.number,
    required this.englishName,
    required this.arabicName,
    required this.verses,
  });
}

const List<SurahData> quranSample = [
  SurahData(
    number: 1,
    englishName: 'Al-Fatihah',
    arabicName: 'الفاتحة',
    verses: [
     VerseData(
        number: 1,
        arabic: 'بِسْمِ ٱللّٰهِ ٱلرَّحْمٰنِ ٱلرَّحِيمِ',
        translations: {
          'fr': 'Au nom d’Allah, le Très Miséricordieux, le Très Compatissant.',
          'sw': 'Kwa jina la Mungu, Mwingi wa Rehema, Mwingi wa Huruma.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'ٱلْحَمْدُ لِلّٰهِ رَبِّ ٱلْعٰلَمِين',
        translations: {
          'fr': 'Toute louange revient à Allah, Seigneur de l’univers.',
          'sw': 'Sifa zote ni za Mungu, Mlezi wa ulimwengu wote.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'ٱلرَّحْمٰنِ ٱلرَّحِيمِ',
        translations: {
          'fr': 'Le Très Miséricordieux, le Très Compatissant.',
          'sw': 'Mwingi wa Rehema, Mwingi wa Huruma.',
        },
      ),
      VerseData(
        number: 4,
        arabic: 'مَٰلِكِ يَوْمِ ٱلدِّينِ',
        translations: {
          'fr': 'Maître du Jour de la Rétribution.',
          'sw': 'Mfalme wa Siku ya Malipo.',
        },
      ),
      VerseData(
        number: 5,
        arabic: 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينِ',
        translations: {
          'fr': 'C’est Toi seul que nous adorons et c’est Toi seul que nous implorons de l’aide.',
          'sw': 'Wewe tu unayemwabudu na Wewe tu unayetuombea msaada.',
        },
      ),
    ],
  ),
  SurahData(
    number: 2,
    englishName: 'Al-Baqarah',
    arabicName: 'البقرة',
    verses: [
      VerseData(
        number: 1,
        arabic: 'الۤمّۤ',
        translations: {
          'fr': 'Alif, Lam, Mim.',
          'sw': 'Alif, Lam, Mim.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'ذَٰلِكَ ٱلْكِتٰبُ لَا رَيْبَ ۛ فِيهِ',
        translations: {
          'fr': 'Ceci est le Livre, point de doute en lui.',
          'sw': 'Hiki ni kitabu, hakuna shaka ndani yake.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'هُدًى لِّلْمُتَّقِينَ',
        translations: {
          'fr': 'Guide pour les pieux.',
          'sw': 'Mwongozo kwa wanao waweza.',
        },
      ),
      VerseData(
        number: 4,
        arabic: 'ٱلَّذِينَ يُؤْمِنُونَ بِٱلْغَيْبِ',
        translations: {
          'fr': 'Ceux qui croient en l’Invisible.',
          'sw': 'Wale wanaoamini kwa kisichoonekana.',
        },
      ),
    ],
  ),
  SurahData(
    number: 3,
    englishName: 'Ali Imran',
    arabicName: 'آل عمران',
    verses: [
      VerseData(
        number: 1,
        arabic: 'الم',
        translations: {
          'fr': 'Alif, Lam, Mim.',
          'sw': 'Alif, Lam, Mim.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'ٱللّٰهِ لَآ إِلٰهَ إِلَّا هُوَ',
        translations: {
          'fr': 'Allah, il n’y a de divinité que Lui.',
          'sw': 'Mungu, hakuna mungu mwingine ila Yeye.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'ٱلْحَيُّ ٱلْقَيُّومُ',
        translations: {
          'fr': 'Le Vivant, le Subsistant par Lui-même.',
          'sw': 'Mwenye kuishi, Mwekezaji wa wote.',
        },
      ),
    ],
  ),
  SurahData(
    number: 4,
    englishName: 'An-Nisa',
    arabicName: 'النساء',
    verses: [
      VerseData(
        number: 1,
        arabic: 'يَٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا',
        translations: {
          'fr': 'Ô vous qui croyez !',
          'sw': 'Enyi walioamini!',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'إِنَّ ٱللّٰهَ كَانَ لَكُمْ رَسُولًا',
        translations: {
          'fr': 'Allah est vraiment votre Seigneur et votre protecteur.',
          'sw': 'Hakika Mungu ni Mola wenu na Mtetezi wenu.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'وَإِنْ خِفْتُمْ أَلَّا تُقْسِطُوا',
        translations: {
          'fr': 'Et si vous craignez de ne pas être équitables.',
          'sw': 'Na kama mtaogopa kutofanya haki.',
        },
      ),
    ],
  ),
  SurahData(
    number: 5,
    englishName: 'Al-Ma’idah',
    arabicName: 'المائدة',
    verses: [
      VerseData(
        number: 1,
        arabic: 'يَٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا',
        translations: {
          'fr': 'Ô vous qui croyez !',
          'sw': 'Enyi walioamini!',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'أَوْفُواْ بِٱلْعُقُودِ',
        translations: {
          'fr': 'Accomplissez les contrats.',
          'sw': 'Timilifuni mikataba.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'حُرِّمَتْ عَلَيْكُمُ ٱلْمَيْتَةُ',
        translations: {
          'fr': 'Il vous est interdit la viande morte.',
          'sw': 'Imeharamishwa kwenu nyama ya wanyama waliokufa.',
        },
      ),
    ],
  ),
  SurahData(
    number: 6,
    englishName: 'Al-An’am',
    arabicName: 'الأنعام',
    verses: [
      VerseData(
        number: 1,
        arabic: 'ٱلْحَمْدُ لِلّٰهِ',
        translations: {
          'fr': 'Louange à Allah.',
          'sw': 'Sifa zote ni za Mungu.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'هُوَ ٱلَّذِي خَلَقَكُم',
        translations: {
          'fr': 'C’est Lui qui vous a créés.',
          'sw': 'Yeye ndiye aliyewatengeneza.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'وَإِلَيْهِ مَرْجِعُكُمْ',
        translations: {
          'fr': 'Et vers Lui est votre retour.',
          'sw': 'Na kwake ndiko kurudi kwenu.',
        },
      ),
    ],
  ),
  SurahData(
    number: 7,
    englishName: 'Al-A’raf',
    arabicName: 'الأعراف',
    verses: [
      VerseData(
        number: 1,
        arabic: 'ٱلْمُص',
        translations: {
          'fr': 'Alif, Lam, Mim, Sad.',
          'sw': 'Alif, Lam, Mim, Sad.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'ٱتْلُ مَآ أُوحِيَ',
        translations: {
          'fr': 'Lis ce qui a été révélé.',
          'sw': 'Soma kile kilichofunuliwa.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'قَدْ أَفْلَحَ ٱلْمُؤْمِنُونَ',
        translations: {
          'fr': 'Les croyants ont réussi.',
          'sw': 'Wanaoamini wamefaulu.',
        },
      ),
    ],
  ),
  SurahData(
    number: 12,
    englishName: 'Yusuf',
    arabicName: 'يوسف',
    verses: [
      VerseData(
        number: 1,
        arabic: 'الر ۚ تِلْكَ ءَايَٰتُ ٱلْقُرْءَانِ',
        translations: {
          'fr': 'Alif, Lam, Ra. Ce sont les versets du Coran.',
          'sw': 'Alif, Lam, Ra. Hizi ni aya za Qurani.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'إِنَّآ أَنزَلْنٰهُ',
        translations: {
          'fr': 'Nous l’avons fait descendre.',
          'sw': 'Hakika tumelishusha.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'وَقَالَ ٱلَّذِي شَرَى',
        translations: {
          'fr': 'Et celui qui l’a acheté dit.',
          'sw': 'Na yule aliyenunua akasema.',
        },
      ),
    ],
  ),
  SurahData(
    number: 14,
    englishName: 'Ibrahim',
    arabicName: 'إبراهيم',
    verses: [
      VerseData(
        number: 1,
        arabic: 'الر',
        translations: {
          'fr': 'Alif, Lam, Ra.',
          'sw': 'Alif, Lam, Ra.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'كِتٰبٌ أَنزَلْنٰهُ',
        translations: {
          'fr': 'Un Livre que Nous avons fait descendre.',
          'sw': 'Kitabu kilichoshushwa na sisi.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'لِيُخْرِجَ ٱلنَّاسَ',
        translations: {
          'fr': 'Pour faire sortir les gens.',
          'sw': 'Kumtoa watu.',
        },
      ),
    ],
  ),
  SurahData(
    number: 16,
    englishName: 'An-Nahl',
    arabicName: 'النحل',
    verses: [
      VerseData(
        number: 1,
        arabic: 'أَتَىٰٓ أَمْرُ ٱللّٰهِ',
        translations: {
          'fr': 'L’ordre d’Allah est arrivé.',
          'sw': 'Amri ya Mungu imefika.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'وَٱللّٰهِ خَلَقَكُمْ',
        translations: {
          'fr': 'Et Allah vous a créés.',
          'sw': 'Na Mungu alikuwa aliyetengeneza.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'إِنَّ فِي ذَٰلِكَ لَءَايَٰتٍ',
        translations: {
          'fr': 'Il y a certes là des signes.',
          'sw': 'Hakika humo mna ishara.',
        },
      ),
    ],
  ),
  SurahData(
    number: 17,
    englishName: 'Al-Isra',
    arabicName: 'الإسراء',
    verses: [
      VerseData(
        number: 1,
        arabic: 'سُبْحٰنَ ٱلَّذِيٓ أَسْرَىٰ',
        translations: {
          'fr': 'Gloire à Celui qui a fait voyager.',
          'sw': 'Ametukuka Yule aliyemfanya asubuhi.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'وَقَلِيلٌ مِّنْ عِبَادِي',
        translations: {
          'fr': 'Et peu de Mes serviteurs sont reconnaissants.',
          'sw': 'Na wachache wa watumishi wangu ni wenye shukrani.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'وَكُلًّا نَّقُصُّ',
        translations: {
          'fr': 'Et Nous ne faisons que raconter.',
          'sw': 'Na kila kitu tunachukua.',
        },
      ),
    ],
  ),
  SurahData(
    number: 18,
    englishName: 'Al-Kahf',
    arabicName: 'الكهف',
    verses: [
      VerseData(
        number: 1,
        arabic: 'ٱلْحَمْدُ لِلّٰهِ',
        translations: {
          'fr': 'Louange à Allah.',
          'sw': 'Sifa zote ni za Mungu.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'قُلِ ٱللّٰهُ أَعْلَمُ',
        translations: {
          'fr': 'Dis : Allah sait mieux.',
          'sw': 'Sema: Mungu anajua zaidi.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'وَلَنَبْلُوَنَّكُمْ',
        translations: {
          'fr': 'Et Nous vous mettrons à l’épreuve.',
          'sw': 'Na tutawajaribu.',
        },
      ),
    ],
  ),
  SurahData(
    number: 19,
    englishName: 'Maryam',
    arabicName: 'مريم',
    verses: [
      VerseData(
        number: 1,
        arabic: 'كهيعص',
        translations: {
          'fr': 'Kaaf Ha Ya Ain Sad.',
          'sw': 'Kaaf Ha Ya Ain Sad.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'ذِكْرُ رَحْمَةِ رَبِّكَ',
        translations: {
          'fr': 'Rappel de la miséricorde de ton Seigneur.',
          'sw': 'Ukumbusho wa rehema ya Mola wako.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'إِذْ نَادَىٰ رَبَّهُ',
        translations: {
          'fr': 'Quand il appela son Seigneur.',
          'sw': 'Wakati alipomkimbia Mola wake.',
        },
      ),
    ],
  ),
  SurahData(
    number: 20,
    englishName: 'Ta-Ha',
    arabicName: 'طه',
    verses: [
      VerseData(
        number: 1,
        arabic: 'طه',
        translations: {
          'fr': 'Ta-Ha.',
          'sw': 'Ta-Ha.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'مَآ أَنزَلْنَا عَلَيْكَ',
        translations: {
          'fr': 'Nous n’avons pas fait descendre sur toi.',
          'sw': 'Hatujashusha juu yako.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'لِتُذْكَرَ',
        translations: {
          'fr': 'Pour que tu sois rappelé.',
          'sw': 'Ili ukumbuke.',
        },
      ),
    ],
  ),
  SurahData(
    number: 21,
    englishName: 'Al-Anbiya',
    arabicName: 'الأنبياء',
    verses: [
      VerseData(
        number: 1,
        arabic: 'قَدْ أَفْلَحَ ٱلْمُؤْمِنُونَ',
        translations: {
          'fr': 'Les croyants ont réussi.',
          'sw': 'Wanaoamini wamefaulu.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'وَإِنَّا لَغَفُّورٌ رَّحِيمٌ',
        translations: {
          'fr': 'Et Nous sommes le Pardonneur, le Miséricordieux.',
          'sw': 'Na hakika sisi ni Msaamifu, Mwingi wa Rehema.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'وَإِنَّكَ لَتْبَشِّرُ',
        translations: {
          'fr': 'Et tu es certes un avertisseur.',
          'sw': 'Na hakika wewe ni mwonya.',
        },
      ),
    ],
  ),
  SurahData(
    number: 23,
    englishName: 'Al-Mu’minun',
    arabicName: 'المؤمنون',
    verses: [
      VerseData(
        number: 1,
        arabic: 'قَدْ أَفْلَحَ ٱلْمُؤْمِنُونَ',
        translations: {
          'fr': 'Les croyants ont réussi.',
          'sw': 'Wanaoamini wamefaulu.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'ٱلَّذِينَ هُمْ فِي صَلَاتِهِمْ خَٰشِعُونَ',
        translations: {
          'fr': 'Ceux dont les prières sont humbles.',
          'sw': 'Wale ambao katika sala zao ni wanyenyekevu.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'وَٱلَّذِينَ هُمْ عَنِ ٱللَّغْوِ مُعْرِضُونَ',
        translations: {
          'fr': 'Et ceux qui s’écartent du futile.',
          'sw': 'Na wale wanaokwepa maneno yasiyo ya maana.',
        },
      ),
    ],
  ),
  SurahData(
    number: 24,
    englishName: 'An-Nur',
    arabicName: 'النور',
    verses: [
      VerseData(
        number: 1,
        arabic: 'سُورَةٌ أَنزَلْنٰهَا',
        translations: {
          'fr': 'Un chapitre que Nous avons fait descendre.',
          'sw': 'Sura ambayo tumeshusha.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'وَأَنزَلْنَا ِإِلَيْهِ',
        translations: {
          'fr': 'Et Nous avons fait descendre sur lui.',
          'sw': 'Na tumeishusha kwake.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'وَلِلَّهِ الْمَثَلُ',
        translations: {
          'fr': 'Et Allah a la meilleure parabole.',
          'sw': 'Na kwa Mungu ni mfano wa mema.',
        },
      ),
    ],
  ),
  SurahData(
    number: 27,
    englishName: 'An-Naml',
    arabicName: 'النمل',
    verses: [
      VerseData(
        number: 1,
        arabic: 'طس',
        translations: {
          'fr': 'Ta-Sin.',
          'sw': 'Ta-Sin.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'هَٰذَا بَلَٰغٌ',
        translations: {
          'fr': 'Ceci est un message.',
          'sw': 'Huu ni ujumbe.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'وَإِنِّي مُنذِرٌ',
        translations: {
          'fr': 'Et je suis un avertisseur.',
          'sw': 'Na mimi ni mwonya.',
        },
      ),
    ],
  ),
  SurahData(
    number: 36,
    englishName: 'Ya-Sin',
    arabicName: 'يس',
    verses: [
      VerseData(
        number: 1,
        arabic: 'يس',
        translations: {
          'fr': 'Ya-Sin.',
          'sw': 'Ya-Sin.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'وَٱلْقُرْءَانِ',
        translations: {
          'fr': 'Par le Coran.',
          'sw': 'Na Qurani.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'إِنَّكَ لَمِنَ ٱلْمُرْسَلِينَ',
        translations: {
          'fr': 'Tu es vraiment un des messagers.',
          'sw': 'Hakika wewe ni mmoja wa watume.',
        },
      ),
    ],
  ),
  SurahData(
    number: 41,
    englishName: 'Fussilat',
    arabicName: 'فصلت',
    verses: [
      VerseData(
        number: 1,
        arabic: 'حم',
        translations: {
          'fr': 'Ha-Mim.',
          'sw': 'Ha-Mim.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'تَنْزِيلٌ مِّنَ ٱللّٰهِ',
        translations: {
          'fr': 'Une révélation du Très Haut.',
          'sw': 'Ufunuo kutoka kwa Mungu.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'وَإِنَّا لَفِي خَلْقٍ',
        translations: {
          'fr': 'Et Nous avons créé avec sagesse.',
          'sw': 'Na hakika sisi ni katika kuumba kwa hekima.',
        },
      ),
    ],
  ),
  SurahData(
    number: 55,
    englishName: 'Ar-Rahman',
    arabicName: 'الرحمن',
    verses: [
      VerseData(
        number: 1,
        arabic: 'ٱلرَّحْمٰنُ',
        translations: {
          'fr': 'Le Très Miséricordieux.',
          'sw': 'Mwingi wa Rehema.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'عَلَّمَ ٱلْقُرْءَانَ',
        translations: {
          'fr': 'Il a enseigné le Coran.',
          'sw': 'Amewafundisha Qurani.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'خَلَقَ ٱلْإِنسَٰنَ',
        translations: {
          'fr': 'Il a créé l’Homme.',
          'sw': 'Amemuumba mwanadamu.',
        },
      ),
    ],
  ),
  SurahData(
    number: 67,
    englishName: 'Al-Mulk',
    arabicName: 'الملك',
    verses: [
      VerseData(
        number: 1,
        arabic: 'تَبَارَكَ ٱلَّذِي بِيَدِهِ',
        translations: {
          'fr': 'Béni est Celui dont la main détient le pouvoir.',
          'sw': 'Amebarikiwa Yule aliye na mamlaka mkononi mwake.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'ٱللّٰهِ ٱلْمَلِكِ',
        translations: {
          'fr': 'Allah, le Souverain.',
          'sw': 'Mungu, Mfalme.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'وَقِيلَ ٱدْخُلُوا',
        translations: {
          'fr': 'Et il a été dit : Entrez.',
          'sw': 'Na ikasemwa: Ingieni.',
        },
      ),
    ],
  ),
  SurahData(
    number: 73,
    englishName: 'Al-Muzzammil',
    arabicName: 'المزمل',
    verses: [
      VerseData(
        number: 1,
        arabic: 'يَٰٓأَيُّهَا ٱلْمُزَّمِّلُ',
        translations: {
          'fr': 'Ô toi qui est enveloppé !',
          'sw': 'Enyi aliyefunikwa!',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'قُمِ ٱلَّيْلَ',
        translations: {
          'fr': 'Prie la nuit.',
          'sw': 'Simama usiku.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'إِنَّ لَكَ فِي ٱلنَّهَارِ',
        translations: {
          'fr': 'Tu as la journée pour accomplir.',
          'sw': 'Kwa kweli una siku ya kufanyia kazi.',
        },
      ),
    ],
  ),
  SurahData(
    number: 96,
    englishName: 'Al-‘Alaq',
    arabicName: 'العلق',
    verses: [
      VerseData(
        number: 1,
        arabic: 'ٱقْرَأْ بِاسْمِ رَبِّكَ',
        translations: {
          'fr': 'Lis au nom de ton Seigneur.',
          'sw': 'Soma kwa jina la Mola wako.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'ٱلَّذِي خَلَقَ',
        translations: {
          'fr': 'Qui a créé.',
          'sw': 'Aliyeumba.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'خَلَقَ ٱلْإِنسَٰنَ مِنْ عَلَقٍ',
        translations: {
          'fr': 'Il a créé l’homme à partir d’une adhérence.',
          'sw': 'Ameumba mwanadamu kutoka kwa gundi.',
        },
      ),
    ],
  ),
  SurahData(
    number: 112,
    englishName: 'Al-Ikhlas',
    arabicName: 'الإخلاص',
    verses: [
      VerseData(
        number: 1,
        arabic: 'قُلْ هُوَ ٱللّٰهُ أَحَدٌ',
        translations: {
          'fr': 'Dis : Il est Allah, l’Unique.',
          'sw': 'Sema: Yeye ni Mungu, Mmoja.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'ٱللّٰهُ ٱلصَّمَدُ',
        translations: {
          'fr': 'Allah, le Dépendant, l’Absolu.',
          'sw': 'Mungu, Mlezi wa wote.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'لَمْ يَلِدْ وَلَمْ يُولَدْ',
        translations: {
          'fr': 'Il n’a engendré ni n’a été engendré.',
          'sw': 'Hajazaliwa wala kuzaa.',
        },
      ),
    ],
  ),
  SurahData(
    number: 113,
    englishName: 'Al-Falaq',
    arabicName: 'الفلق',
    verses: [
      VerseData(
        number: 1,
        arabic: 'قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ',
        translations: {
          'fr': 'Dis : Je cherche refuge auprès du Seigneur de l’aube.',
          'sw': 'Sema: Ninatafuta kinga kwa Mola wa mapema.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'مِن شَرِّ مَا خَلَقَ',
        translations: {
          'fr': 'Du mal de ce qu’Il a créé.',
          'sw': 'Kutoka kwa madhara ya kilichochiumba.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ',
        translations: {
          'fr': 'Et du mal de la nuit quand elle s’assombrit.',
          'sw': 'Na kutoka kwa madhara ya usiku ukitokea.',
        },
      ),
    ],
  ),
  SurahData(
    number: 114,
    englishName: 'An-Nas',
    arabicName: 'الناس',
    verses: [
      VerseData(
        number: 1,
        arabic: 'قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ',
        translations: {
          'fr': 'Dis : Je cherche refuge auprès du Seigneur des hommes.',
          'sw': 'Sema: Ninatafuta kinga kwa Mola wa watu.',
        },
      ),
      VerseData(
        number: 2,
        arabic: 'مَلِكِ ٱلنَّاسِ',
        translations: {
          'fr': 'Roi des hommes.',
          'sw': 'Mfalme wa watu.',
        },
      ),
      VerseData(
        number: 3,
        arabic: 'إِلَٰهِ ٱلنَّاسِ',
        translations: {
          'fr': 'Dieu des hommes.',
          'sw': 'Mungu wa watu.',
        },
      ),
    ],
  ),
];
