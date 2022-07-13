import 'package:flutter/material.dart';
import 'package:portfolio/src/home_page/widgets/home.dart';

class CodeLab extends StatefulWidget {
  const CodeLab({Key? key}) : super(key: key);

  @override
  State<CodeLab> createState() => CodeLabState();
}

class CodeLabState extends State<CodeLab> {
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
            children: const <Widget>[],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
