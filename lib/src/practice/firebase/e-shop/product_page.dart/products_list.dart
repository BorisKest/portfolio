import 'package:flutter/material.dart';
import 'package:portfolio/src/practice/firebase/e-shop/models/products.dart';
import 'package:portfolio/src/practice/firebase/e-shop/services/product_stream.dart';

import '../explore_page/widgets/grid_tilse.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  int indexInList = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(Icons.search),
        ],
      ),
      body: StreamBuilder(
        stream: ProductStream().getProductStream(),
        builder: (context, snapshot) {
          final tilesGrid = <GridTile>[];
          if (snapshot.hasData) {
            final products = snapshot.data as List<Product>;
            tilesGrid.addAll(products.map((nextProduct) {
              return GridTile(
                  child: GridCard(
                image: nextProduct.image,
                text: nextProduct.name,
              ));
            }));
          }
          return GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 20,
              mainAxisSpacing: 20,
            ),
            children: GridView(),
          );
        },
      ),
    );
  }
}
