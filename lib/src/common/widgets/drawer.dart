import 'package:flutter/material.dart';
import 'package:portfolio/src/CodeLab/widgets/codeLab_page.dart';
import 'package:portfolio/src/home_page/widgets/home.dart';

class DrawerCreate extends StatelessWidget {
  const DrawerCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          ListTile(
            title: const Text('CoadLab'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CodeLab(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
