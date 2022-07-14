import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/model/note.dart';

abstract class INotesController {
  List<Note> get notes;

  abstract final Stream<List<Note>> stream;

  Future<void> fetch();

  Future<void> upsert(Note note);

  Future<void> delete(Note note);
}

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note your note.'),
        actions: [
          IconButton(
            onPressed: (() {
              setState(() {});
            }),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(),
    );
  }
}
