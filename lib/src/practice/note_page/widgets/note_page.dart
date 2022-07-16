import 'package:flutter/material.dart';
import 'package:portfolio/src/model/note.dart';
import 'package:portfolio/src/service/db_helper.dart';

abstract class INotesController {
  List<Note> get notes;

  abstract final Stream<List<Note>> stream;
  dynamic note = '';
  int id = 0;

  Future<void> fetch(note) async {
    DBProvider.db.newNote(note);
  }

  Future<void> upsert(Note note) async {
    DBProvider.db.updateNote(note);
  }

  Future<void> delete(Note note) async {
    DBProvider.db.deleteNote(id);
  }
}

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late TextEditingController _controller;

  Future<void> _addNote() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Add new note'),
              ],
            ),
          ),
          actions: <Widget>[
            TextField(controller: _controller, onSubmitted: (String value) {}),
            TextButton(
              child: const Text('Add'),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note your note.'),
        actions: [
          IconButton(
            onPressed: (() {
              _addNote();
              setState(() {});
            }),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const Center(),
    );
  }
}
