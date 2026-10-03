import '../data/dua_data.dart';

class DuaService {
  List<DuaItem> getAll() => duaList;

  DuaItem? getById(String id) {
    try {
      return duaList.firstWhere((d) => d.id == id);
    } catch (_) {
      return null;
    }
  }

  List<DuaItem> search(String q) {
    final query = q.toLowerCase();
    return duaList.where((d) {
      return d.title.toLowerCase().contains(query) ||
          d.arabic.toLowerCase().contains(query) ||
          d.translation.toLowerCase().contains(query);
    }).toList();
  }
}
