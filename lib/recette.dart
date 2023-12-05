import 'package:flutter/material.dart';

class RecettesRoute extends StatelessWidget {
  const RecettesRoute({Key? key, required this.inventaire});
  static const recettes = <Map<String, dynamic>>[
    {
      "nom": "Hache",
      "cout": [
        {"qte": 2, "nom": "Bois"},
        {"qte": 2, "nom": "Tige"}
      ],
      "gameplay": "Récolter le bois 3 par 3 (3 par clic)",
      "type": "Outil",
      "description": "Un outil utile"
    },
    {
      "nom": "Pioche",
      "cout": [
        {"qte": 2, "nom": "Bois"},
        {"qte": 3, "nom": "Tige"}
      ],
      "gameplay": "Récolter les minerais 5 par 5 (5 par clic)",
      "type": "Outil",
      "description": "Un outil utile"
    },
    {
      "nom": "Lingot de fer",
      "cout": [
        {"qte": 1, "nom": "Minerai de fer"}
      ],
      "gameplay": "Débloque d'autres recettes",
      "type": "Matériau",
      "description": "Un lingot de fer pur"
    },
    {
      "nom": "Plaque de fer",
      "cout": [
        {"qte": 3, "nom": "Lingot de fer"}
      ],
      "gameplay": "Débloque d'autres recettes",
      "type": "Matériau",
      "description": "Une plaque de fer solide"
    },
    {
      "nom": "Tige en métal",
      "cout": [
        {"qte": 1, "nom": "Lingot de fer"}
      ],
      "gameplay": "Débloque d'autres recettes",
      "type": "Matériau",
      "description": "Une tige de métal solide"
    },
    {
      "nom": "Fil éléctrique",
      "cout": [
        {"qte": 1, "nom": "Lingot de cuivre"}
      ],
      "gameplay": "Débloque d’autres recettes",
      "type": "Composant",
      "description":
          "Un fil électrique pour fabriquer des composants électroniques"
    },
    {
      "nom": "Couteau",
      "cout": [
        {"qte": 1, "nom": "Bois"},
        {"qte": 1, "nom": "Tige"}
      ],
      "gameplay": "Couper des arbres et des buissons",
      "type": "Outil",
      "description": "Un outil utile"
    },
    {
      "nom": "Râteau",
      "cout": [
        {"qte": 3, "nom": "Bois"},
        {"qte": 1, "nom": "Tige"}
      ],
      "gameplay": "Récolter les cultures",
      "type": "Outil",
      "description": "Un outil utile"
    },
    {
      "nom": "Brique",
      "cout": [
        {"qte": 2, "nom": "Lingot de fer"}
      ],
      "gameplay": "Construire des structures",
      "type": "Matériau",
      "description": "Une brique solide"
    }
  ];
  final Map<String, int> inventaire;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recettes'),
      ),
      body: ListView.builder(
        itemCount: recettes.length,
        itemBuilder: (context, index) {
          final recette = recettes[index];
          final couts = recette['cout'] as List<dynamic>;

          // Vérifier si les ressources sont suffisantes pour produire la recette
          bool ressourcesSuffisantes =
              true; // Par défaut, considérons que les ressources sont suffisantes
          for (var cout in couts) {
            final nom = cout['nom'];
            final qte = cout['qte'];
            if (inventaire[nom] == null || inventaire[nom]! as int < qte) {
              ressourcesSuffisantes = false;
            }
          }

          // Construction de la représentation des coûts sous forme de texte
          String coutText = '';
          for (var cout in couts) {
            final nom = cout['nom'];
            final qte = cout['qte'];
            coutText += '$qte $nom, ';
          }
          coutText = coutText.substring(
              0, coutText.length - 2); // Retirer la virgule en trop à la fin

          return ListTile(
            title: Text(recette['nom']),
            subtitle: Text('${recette['description']} - Coûts: $coutText'),
            onTap: () {
              // Action lorsqu'on appuie sur la recette
            },
            trailing: ElevatedButton(
              onPressed: ressourcesSuffisantes
                  ? () {
                      // Action pour produire l'objet correspondant à la recette
                      // Ajouter l'objet à l'inventaire
                    }
                  : null, // Si les ressources ne sont pas suffisantes, le bouton est désactivé
              child: const Text('Produire'),
            ),
          );
        },
      ),
    );
  }
}
