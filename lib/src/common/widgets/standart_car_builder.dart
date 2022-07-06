import 'dart:html';

import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  const BuildCard(
      {Key? key,
      required Icon this.icon,
      required String this.titleText,
      required String this.bodyText,
      required String this.image})
      : super(key: key);
  final icon;
  final titleText;
  final bodyText;
  final image;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon),
            ],
          )
        ],
      ),
    );
  }
}
