import 'package:flutter/material.dart';
import 'package:portfolio/src/common/widgets/drawer.dart';
import 'package:portfolio/src/practice/accelerometer/accelerometer.dart';
import 'package:portfolio/src/practice/bloc/qubit/qubit.dart';
import 'package:portfolio/src/practice/note_page/widgets/note_page.dart';
import 'package:portfolio/src/practice/stream/widgets/stream_page.dart';

class CodeLab extends StatefulWidget {
  const CodeLab({Key? key}) : super(key: key);

  @override
  State<CodeLab> createState() => _CodeLabState();
}

class _CodeLabState extends State<CodeLab> {
  @override
  Widget build(BuildContext context) {
    var sideSpace = MediaQuery.of(context).size.width / 7;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice'),
      ),
      body: Container(
        color: Theme.of(context).secondaryHeaderColor,
        margin: EdgeInsets.only(left: sideSpace, top: 30, right: sideSpace),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: sideSpace,
                child: OutlinedButton(
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
              ),
              const Divider(),
              OutlinedButton(
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
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccelerometerScreen(),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(Icons.speed),
                    Text(' SPEED'),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (const QubitScrin()),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(Icons.query_builder_outlined),
                    Text(' Qubit'),
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
