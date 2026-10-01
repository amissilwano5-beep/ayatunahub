import 'package:flutter/material.dart';
import '../data/names99.dart';

class Names99Page extends StatelessWidget {
  const Names99Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Les 99 noms d'Allah")),
      body: ListView.builder(
        itemCount: names99.length,
        itemBuilder: (c, i) {
          final n = names99[i];
          return ListTile(
            title: Text(n['arabic'] ?? ''),
            subtitle: Text('${n['transliteration'] ?? ''} — ${n['meaning'] ?? ''}'),
          );
        },
      ),
    );
  }
}
