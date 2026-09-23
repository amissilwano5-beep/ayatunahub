import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class CalendarService {
  static String formatGregorian(DateTime date) {
    return DateFormat('EEEE d MMMM y', 'fr_FR').format(date);
  }

  static String formatHijri(DateTime date) {
    final hijri = HijriCalendar.fromDate(date);
    final monthName = _toFrenchMonth(hijri.longMonthName);
    return '${hijri.hDay} $monthName ${hijri.hYear} AH';
  }

  static String formatWeekday(DateTime date) {
    return DateFormat('EEEE', 'fr_FR').format(date);
  }

  static List<Map<String, String>> getKeyMoments(DateTime date) {
    final hijri = HijriCalendar.fromDate(date);

    return [
      {
        'title': 'Nouvelle année islamique',
        'detail': hijri.hMonth == 1 && hijri.hDay == 1 ? 'Aujourd’hui est le 1er Mouharram.' : 'Le 1er Mouharram est un moment de réflexion et de renouvellement.',
      },
      {
        'title': 'Ashura',
        'detail': hijri.hMonth == 1 && hijri.hDay == 10 ? 'Journée spéciale de mémoire et d’actions bonnes.' : 'Le 10 Mouharram est un jour très important dans la tradition islamique.',
      },
      {
        'title': 'Mawlid',
        'detail': hijri.hMonth == 3 && hijri.hDay == 12 ? 'Célébration de la naissance du Messager.' : 'Le 12 Rabi’ al-awwal est célébré comme le Maouloud.',
      },
      {
        'title': 'Ramadan',
        'detail': hijri.hMonth == 9 ? 'Période de jeûne, recueillement et piété.' : 'Le mois de Ramadan est un temps de purification spirituelle.',
      },
      {
        'title': 'Aïd al-Fitr',
        'detail': hijri.hMonth == 10 && hijri.hDay == 1 ? 'Fête de la rupture du jeûne.' : 'La fête du 1er Shawwal est une joie pour la communauté.',
      },
      {
        'title': 'Aïd al-Adha',
        'detail': hijri.hMonth == 12 && hijri.hDay == 10 ? 'Jour de sacrifice et de partage.' : 'Le 10 Dhou al-Hijja est associé au sacrifice et à la foi.',
      },
    ];
  }

  static String _toFrenchMonth(String monthName) {
    final normalised = monthName.trim();
    final map = {
      'Muharram': 'Mouharram',
      'Safar': 'Safar',
      'Rabi\' al-awwal': 'Rabi\' al-awwal',
      'Rabi\' al-thani': 'Rabi\' al-thani',
      'Jumada al-awwal': 'Joumada al-awwal',
      'Jumada al-thani': 'Joumada al-thani',
      'Rajab': 'Rajab',
      'Sha\'ban': 'Cha\'ban',
      'Ramadan': 'Ramadan',
      'Shawwal': 'Chaoual',
      'Dhu al-Qidah': 'Dhou al-Qaida',
      'Dhu al-Hijjah': 'Dhou al-Hijja',
    };

    return map[normalised] ?? normalised;
  }
}
