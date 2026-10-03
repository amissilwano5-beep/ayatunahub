import 'package:flutter/material.dart';
import '../services/dua_service.dart';

class DuaPage extends StatefulWidget {
  const DuaPage({super.key});

  @override
  State<DuaPage> createState() => _DuaPageState();
}

class _DuaPageState extends State<DuaPage> {
  final DuaService _service = DuaService();
  List _items = [];

  @override
  void initState() {
    super.initState();
    _items = _service.getAll();
  }

  void _onSearch(String q) {
    setState(() {
      _items = q.isEmpty ? _service.getAll() : _service.search(q);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dua')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Rechercher dua...'),
              onChanged: _onSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (c, i) {
                final item = _items[i];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.translation),
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(item.title),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.arabic, style: const TextStyle(fontSize: 20)),
                            const SizedBox(height: 12),
                            Text(item.transliteration),
                            const SizedBox(height: 12),
                            Text(item.translation),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Fermer')),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
