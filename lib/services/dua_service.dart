import '../data/dua_data.dart';

class DuaService {
  List<DuaItem> getAll() => duaList;

  DuaItem? getById(String id) => duaList.firstWhere((d) => d.id == id, orElse: () => null);

  List<DuaItem> search(String q) {
    final ql = q.toLowerCase();
    return duaList.where((d) => d.title.toLowerCase().contains(ql) || d.arabic.contains(q) || d.translation.toLowerCase().contains(ql)).toList();
  }
}
