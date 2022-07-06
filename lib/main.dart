import 'package:flutter/material.dart';
import 'package:portfolio/src/settings/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          Title(
            color: Colors.black,
            child: Text(
              'Portfolio',
              style: TextStyle(
                fontSize: 40,
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
