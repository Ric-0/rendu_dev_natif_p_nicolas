import 'package:flutter/material.dart';

class InventaireRoute extends StatefulWidget {
  const InventaireRoute({Key? key, required this.inventaire}) : super(key: key);

  final Map<String, int> inventaire;

  @override
  _InventaireRouteState createState() => _InventaireRouteState();
}

class _InventaireRouteState extends State<InventaireRoute> {
  Map<String, int> _inventaire = {};

  bool _triCroissant = true;

  @override
  void initState() {
    super.initState();
    _inventaire = widget.inventaire;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventaire'),
        actions: [
          // Bouton pour trier par quantité
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            onPressed: () {
              _triCroissant = !_triCroissant;
              setState(() {
                List<MapEntry<String, int>> sortedEntries =
                    _inventaire.entries.toList();
                if (_triCroissant) {
                  sortedEntries.sort((a, b) => a.value.compareTo(b.value));
                } else {
                  sortedEntries.sort((a, b) => b.value.compareTo(a.value));
                }

                _inventaire = {};
                sortedEntries
                    .forEach((entry) => _inventaire[entry.key] = entry.value);
              });
            },
          ),

          // Bouton pour trier par nom
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            onPressed: () {
              _triCroissant = !_triCroissant;
              setState(() {
                List<MapEntry<String, int>> sortedEntries =
                    _inventaire.entries.toList();
                if (_triCroissant) {
                  sortedEntries.sort((a, b) => a.key.compareTo(b.key));
                } else {
                  sortedEntries.sort((a, b) => b.key.compareTo(a.key));
                }

                _inventaire = {};
                sortedEntries
                    .forEach((entry) => _inventaire[entry.key] = entry.value);
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _inventaire.length,
        itemBuilder: (context, index) {
          final recette = _inventaire.keys.elementAt(index);
          final qte = _inventaire[recette]!;

          return ListTile(
            title: Text(recette),
            subtitle: Text('Qté: $qte'),
          );
        },
      ),
    );
  }
}
