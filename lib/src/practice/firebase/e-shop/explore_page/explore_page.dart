import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portfolio/src/practice/firebase/e-shop/explore_page/widgets/grid_tilse.dart';
import 'package:portfolio/src/practice/firebase/widgets/text_card.dart';

List<String> dogCategoryName = [
  'Dog Food',
  'Dog Treats',
  'Dog Treatment',
  'Dog Grooming',
  'Dog toys',
  'Dog accessories',
  'Dog accessories',
];
List<String> catCategoryName = [
  'Cat Food',
  'Cat Treats',
  'Cat Treatment',
  'Cat Grooming',
  'Cat toys',
  'Cat accessories',
];

List<String> imagesCategory = [
  'assets/images/pets/dog_food1.jpg',
  'assets/images/pets/dog8.jpg',
  'assets/images/pets/dog_food3.jpg',
  'assets/images/pets/dog_food2.jpg',
  'assets/images/pets/dog6.jpg',
  'assets/images/pets/dog4.jpg',
  'assets/images/pets/dog4.jpg',
];

List<Color> colorList = [
  Colors.yellow,
  Colors.pink,
  Colors.orange,
  Colors.deepOrange,
  Colors.lightBlue,
  Colors.green
];

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(Icons.search),
        ],
      ),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: const [
                      TextCard(text: 'All'),
                      TextCard(text: 'Dog'),
                      TextCard(text: 'Cat'),
                      TextCard(text: 'Small Animal'),
                      TextCard(text: 'Big Animal'),
                    ],
                  ),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 392,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int indexInList) {
                  return GridCard(
                    image: imagesCategory[indexInList],
                    text: dogCategoryName[indexInList],
                    color: colorList[indexInList],
                    productId: indexInList,
                  );
                },
                childCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
