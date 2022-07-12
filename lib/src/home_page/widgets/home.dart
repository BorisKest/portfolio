import 'package:flutter/material.dart';
import 'package:portfolio/src/settings/settings.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool themeBool = true;
  Icon themeIcon = Icon(Icons.dark_mode_sharp);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 30),
          child: const Text('Boris Kastner'),
        ),
        actions: [
          IconButton(
            onPressed: (() {
              setState(() {
                if (themeBool == true) {
                  themeIcon = const Icon(Icons.light_mode);
                  themeBool = !themeBool;
                } else {
                  themeIcon = const Icon(Icons.dark_mode);
                  themeBool = !themeBool;
                }
              });
              Settings().setTheme(themeBool);
            }),
            icon: themeIcon,
            padding: const EdgeInsets.only(right: 30),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: const Text(
              'Portfolio',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Nuitro',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
