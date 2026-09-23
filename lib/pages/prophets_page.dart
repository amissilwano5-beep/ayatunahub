import 'package:flutter/material.dart';

class ProphetsPage extends StatelessWidget {
  const ProphetsPage({super.key});

  static const List<Map<String, String>> prophets = [
    {
      'name': 'Adam (AS)',
      'story': 'Le premier homme et le premier prophète. Il a été créé par Allah et a appris le savoir et la vie sur terre.',
    },
    {
      'name': 'Noé (AS)',
      'story': 'Il a appelé son peuple au monothéisme et a guidé les croyants pendant des années avant le déluge.',
    },
    {
      'name': 'Abraham (AS)',
      'story': 'Il a appelé à l’Unicité d’Allah, a rejeté l’idolâtrie et a été béni dans sa foi et sa patience.',
    },
    {
      'name': 'Moussa (AS)',
      'story': 'Il a été envoyé pour guider les Bani Israël, lutter contre la tyrannie et recevoir la Torah.',
    },
    {
      'name': 'Isa (AS)',
      'story': 'Il a été un prophète de miséricorde, de savoir et de vérité, et il a appelé à la bonne conduite.',
    },
    {
      'name': 'Muhammad ﷺ',
      'story': 'Le dernier des prophètes, porteur du Saint Coran et de la foi complète pour toute l’humanité.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histoire des prophètes'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: prophets.length,
        itemBuilder: (context, index) {
          final prophet = prophets[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Text('${index + 1}'),
              ),
              title: Text(prophet['name'] ?? ''),
              subtitle: Text(prophet['story'] ?? ''),
            ),
          );
        },
      ),
    );
  }
}
