import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/src/practice/firebase/e-shop/models/products.dart';
import 'package:portfolio/src/practice/firebase/e-shop/services/product_stream.dart';

import '../explore_page/widgets/grid_tilse.dart';
import 'widgets/product_grid_builder.dart';

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
            final tilesList = <ListTile>[];
            if (snapshot.hasData) {
              final products = snapshot.data as List<Product>;
              tilesList.addAll(products.map((nextProduct) {
                return ListTile(
                  title: Text(nextProduct.name),
                  subtitle: Text(nextProduct.descripton),
                );
              }));
            } else {
              return Text('no data');
            }
            return Container();
          }),
    );
  }
}
