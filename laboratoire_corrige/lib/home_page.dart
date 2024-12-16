import 'package:flutter/material.dart';
import 'second_page.dart';
import 'tache.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Liste des tâches
  List<Tache> todos = [];


  // Ajoute une tâche à la liste
  void _addTodoItem(Tache todo) {
    setState(() {
      todos.add(todo);
    });
  }

  // Supprime une tâche de la liste
  void _deleteTodoItem(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des tâches'),
      ),
      // Affiche la liste des tâches
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].nom),
            subtitle: Text(todos[index].description),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteTodoItem(index),
            ),
          );
        },
      ),
      // Bouton pour ajouter une tâche
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final nouvelleTache = await Navigator.push<Tache>(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
          //
          if (nouvelleTache != null) {
            _addTodoItem(nouvelleTache);
          }
        },
      ),
    );
  }
}
