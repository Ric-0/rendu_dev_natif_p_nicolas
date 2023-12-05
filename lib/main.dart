import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rendu_dev_natif_p_nicolas/quete.dart';
import 'package:rendu_dev_natif_p_nicolas/ressources.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, int> resources = {
    'Bois': 0,
    'Minerai de cuivre': 0,
    'Minerai de fer': 0,
    'Charbon': 0,
  };
  late Quete quete;

  Quete _generateRandomQuest() {
    final List<Quete> quests = [
      Quete(
          titre: 'Récolter 100 Bois',
          description:
              'Collectez 100 Bois pour obtenir 100 Bois.',
          type: QueteType.collection,
          recompense: '100 Bois',
          resource: 'Bois'),
      Quete(
          titre: 'Récolter 100 Minerai de cuivre',
          description:
              'Collectez 100 Minerai de cuivre pour obtenir 100 Minerai de cuivre.',
          type: QueteType.collection,
          recompense: '100 Minerai de cuivre',
          resource: 'Minerai de cuivre'),
      Quete(
          titre: 'Récolter 100 Minerai de fer',
          description:
              'Collectez 100 Minerai de fer pour obtenir 100 Minerai de fer.',
          type: QueteType.collection,
          recompense: '100 Minerai de fer',
          resource: 'Minerai de fer'),
    ];

    if (resources['Charbon']! >= 1) {
      quests.add(
        Quete(
            titre: 'Récolter 100 resource',
            description:
                'Collectez 100 Charbon pour obtenir 100 Charbon.',
            type: QueteType.collection,
            recompense: '100 Charbon',
            resource: 'Charbon'),
      );
    }

    return quests[Random().nextInt(quests.length)];
  }

  @override
  Widget build(BuildContext context) {
    quete = _generateRandomQuest();
    return Scaffold(
      body: Center(
        child: ListeRessources(
          resources: resources,
          quest: _generateRandomQuest(),
          onResourceIncrement: (String resourceName) {
            setState(() {
              resources.update(resourceName, (value) => value + 1);
              print(resourceName + ' ' + quete.resource);
              if (resourceName == quete.resource) {
                quete.terminee = true;
              }
            });
          },
        ),
      ),
    );
  }
}
