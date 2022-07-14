import 'package:flutter/material.dart';
import 'package:portfolio/src/common/widgets/drawer.dart';
import 'package:portfolio/src/practice/stream/widgets/stream_page.dart';

import 'note_page/widgets/note_page.dart';

class CodeLab extends StatefulWidget {
  const CodeLab({Key? key}) : super(key: key);

  @override
  State<CodeLab> createState() => _CodeLabState();
}

class _CodeLabState extends State<CodeLab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Codelab'),
      ),
      body: Container(
        color: Theme.of(context).secondaryHeaderColor,
        margin: const EdgeInsets.only(left: 150, top: 30, right: 150),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              ElevatedButton(
                onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StreamPage(),
                    ),
                  );
                }),
                child: Row(
                  children: const [
                    Icon(Icons.stream),
                    Text(' Stream'),
                  ],
                ),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotePage(),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(Icons.note),
                    Text(' Note'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const DrawerCreate(),
    );
  }
}
