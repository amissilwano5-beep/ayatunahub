import '../data/azkar_data.dart';

class AzkarService {
  List<AzkarItem> getAll() => azkarList;

  AzkarItem? getById(String id) => azkarList.firstWhere((e) => e.id == id, orElse: () => null);

  List<AzkarItem> search(String query) {
    final q = query.toLowerCase();
    return azkarList.where((a) => a.title.toLowerCase().contains(q) || a.arabic.contains(q) || a.translation.toLowerCase().contains(q)).toList();
  }
}
