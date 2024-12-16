import 'package:flutter/material.dart';
import 'tache.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une tâche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            // Espacement
            const SizedBox(height: 20),
            // Bouton pour ajouter la tâche
            ElevatedButton(
              onPressed: () {
                final nouvelleTache = Tache(
                  nom: _nameController.text,
                  description: _descriptionController.text,
                );
                // Retourne la nouvelle tâche à la page précédente
                Navigator.pop(context, nouvelleTache);
              },
              child: const Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
