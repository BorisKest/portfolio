import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portfolio/src/practice/firebase/widgets/text_card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Row(
        children: const [
          TextCard(text: 'All'),
          TextCard(text: 'Dog'),
          TextCard(text: 'Cat'),
          TextCard(text: 'Small Animal'),
          TextCard(text: 'Big Animal'),
        ],
      ),
    ));
  }
}
