import 'package:flutter/material.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  static const List<Map<String, String>> topics = [
    {
      'title': 'Comment faire les ablutions (Wudu)',
      'content':
          '1. Nia (intention). 2. Se laver les mains jusqu’aux poignets. 3. Rincer la bouche. 4. Se rincer le nez. 5. Se laver le visage. 6. Se laver les bras jusqu’aux coudes. 7. Passer les mains mouillées sur la tête. 8. Nettoyer les oreilles. 9. Se laver les pieds jusqu’aux chevilles. 10. Terminer en priant avec une intention sincère.',
    },
    {
      'title': 'Comment prier (Salat)',
      'content':
          'Le musulman se purifie, se tourne vers la Qibla, fait la Niyya, puis exécute les prières obligatoires : Fajr, Dhuhr, Asr, Maghrib et Isha. Il récite le Coran, fait le Ruku et les Sujud, et termine par les salutations.',
    },
    {
      'title': 'Les 5 piliers de l’islam',
      'content':
          '1. La Shahada : proclamation de la foi. 2. La Salat : les cinq prières quotidiennes. 3. La Zakat : l’aumône obligatoire. 4. Le Sawm : le jeûne du Ramadan. 5. Le Hajj : le pèlerinage à La Mecque pour ceux qui en ont les moyens.',
    },
    {
      'title': 'Les 6 piliers de la foi',
      'content':
          '1. Croire en Allah. 2. Croire en Ses anges. 3. Croire en Ses Livres. 4. Croire en Ses messagers. 5. Croire au Jour du Jugement. 6. Croire au destin (Qadr).',
    },
    {
      'title': 'L’histoire de l’islam',
      'content':
          'L’islam a été proclamé par le prophète Muhammad ﷺ en Arabie. Il invite les gens à la vérité, à la justice, à la pureté du cœur et à l’adoration d’un seul Allah. Il a enseigné le bien, la paix, la compassion et la responsabilité devant Dieu.',
    },
    {
      'title': 'Les bonnes manières du musulman',
      'content':
          'Le musulman doit parler la vérité, respecter ses parents, aider les autres, prendre soin des voisins, éviter la médisance, lire le Coran et faire des invocations régulières.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Savoir plus sur l’islam'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              title: Text(topic['title'] ?? ''),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    topic['content'] ?? '',
                    style: const TextStyle(fontSize: 15, height: 1.7),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
