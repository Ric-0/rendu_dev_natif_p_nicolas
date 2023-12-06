import 'package:flutter/material.dart';
import 'package:rendu_dev_natif_p_nicolas/inventaire.dart';
import 'package:rendu_dev_natif_p_nicolas/quete.dart';
import 'package:rendu_dev_natif_p_nicolas/recette.dart';

class ListeRessources extends StatefulWidget {
  const ListeRessources({
    Key? key,
    required this.resources,
    required this.quest,
    required this.onResourceIncrement,
  });

  final Map<String, int> resources;
  final Function(String) onResourceIncrement;
  final Quete quest;

  @override
  State<ListeRessources> createState() => _ListeRessourcesState();
}

class _ListeRessourcesState extends State<ListeRessources> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ressources'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list), // Icône pour les recettes
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        RecettesRoute(inventaire: widget.resources)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.inventory), // Icône pour l'inventaire
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        InventaireRoute(inventaire: widget.resources)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.question_answer), // Icône pour l'inventaire
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListeQuete(inventaire: widget.resources, quest: widget.quest)),
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: [
          Ressource(
            color: const Color(0xffb967969),
            text: 'Bois',
            resourceValue: widget.resources['Bois'] ?? 0,
            onPressed: () => widget.onResourceIncrement('Bois'),
          ),
          Ressource(
            color: const Color(0xffbced4da),
            text: 'Fer',
            resourceValue: widget.resources['Minerai de fer'] ?? 0,
            onPressed: () => widget.onResourceIncrement('Minerai de fer'),
          ),
          Ressource(
            color: const Color(0xffbd9480f),
            text: 'Cuivre',
            resourceValue: widget.resources['Minerai de cuivre'] ?? 0,
            onPressed: () => widget.onResourceIncrement('Minerai de cuivre'),
          ),
          // Afficher Charbon si disponible
          if (widget.resources['Minerai de fer']! >= 1000 &&
              widget.resources['Minerai de cuivre']! >= 1000)
            Ressource(
              color: const Color(0xFF000000),
              text: 'Charbon',
              resourceValue: 0,
              onPressed: () => widget.onResourceIncrement('Charbon'),
            ),
        ],
      ),
    );
  }
}

class Ressource extends StatelessWidget {
  const Ressource({
    Key? key,
    required this.color,
    required this.text,
    required this.resourceValue,
    required this.onPressed,
  });

  final Color color;
  final String text;
  final int resourceValue;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$resourceValue',
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text('Miner $text'),
          ),
        ],
      ),
    );
  }
}
