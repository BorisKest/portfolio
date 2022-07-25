import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portfolio/src/practice/firebase/e-shop/explore_page/widgets/grid_tilse.dart';

class BuildGrid extends StatelessWidget {
  String image;
  String text;
  BuildGrid({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500),
      itemBuilder: (context, index) {
        return GridCard(image: image, text: text);
      },
    );
  }
}
