import '../data/azkar_data.dart';

class AzkarService {
  List<AzkarItem> getAll() => azkarList;

  AzkarItem? getById(String id) {
    try {
      return azkarList.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  List<AzkarItem> search(String query) {
    final q = query.toLowerCase();
    return azkarList.where((a) {
      return a.title.toLowerCase().contains(q) ||
          a.arabic.toLowerCase().contains(q) ||
          a.translation.toLowerCase().contains(q);
    }).toList();
  }
}
