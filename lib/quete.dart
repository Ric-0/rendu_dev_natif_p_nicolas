import 'package:flutter/material.dart';

enum QueteType {
  collection,
  construction,
}

class Quete {
  final String titre;
  final String description;
  final QueteType type;
  final String recompense;
  final int minResourceValue;
  final String resource;
  bool terminee;

  Quete(
      {required this.titre,
      required this.description,
      required this.type,
      required this.recompense,
      required this.resource,
      this.minResourceValue = 0,
      this.terminee = false});
}

class ListeQuete extends StatefulWidget {
  const ListeQuete({
    Key? key,
    required this.inventaire,
    required this.quest,
  });

  final Map<String, int> inventaire;
  final Quete quest;

  @override
  State<ListeQuete> createState() => _ListeQuete();
}

class _ListeQuete extends State<ListeQuete> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quêtes'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.quest.titre),
            subtitle: Text(widget.quest.description),
            leading: Icon(
              Icons.check,
              color: widget.quest.terminee ? Colors.green : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}