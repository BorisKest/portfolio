import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(Icons.favorite),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [],
          ),
          Row(
            children: [
              Text('name'),
              Spacer(),
              Text('price'),
            ],
          ),
          Text('Characteristics'),
          Row(
            children: [
              Icon(Icons.star_rate),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: (() {}),
                child: const Text('-'),
              ),
              Card(
                child: Text('1'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('+'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
