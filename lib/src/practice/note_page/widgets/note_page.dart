import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/src/model/note.dart';

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

  var _noteSteam;

  @override
  void initState() {
    // final noteService = NotesBloc();
    //_noteSteam = noteService.noteSteram.stream;
    super.initState();
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
      body: StreamBuilder<Note>(
        stream: _noteSteam,
        builder: (context, state) {
          if (!state.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [Text('No notes yet.')],
              ),
            );
          }

          return ListView.builder(
            itemBuilder: ((context, index) {
              return _noteSteam.listen((value) {
                Text(value);
              });
            }),
          );
        },
      ),
    );
  }
}
