import 'package:flutter/material.dart';
import '../services/azkar_service.dart';

class AzkarPage extends StatefulWidget {
  const AzkarPage({super.key});

  @override
  State<AzkarPage> createState() => _AzkarPageState();
}

class _AzkarPageState extends State<AzkarPage> {
  final AzkarService _service = AzkarService();
  List _items = [];
  String _query = '';

  @override
  void initState() {
    super.initState();
    _items = _service.getAll();
  }

  void _onSearch(String q) {
    setState(() {
      _query = q;
      _items = q.isEmpty ? _service.getAll() : _service.search(q);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Azkar')), 
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Rechercher...'),
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
