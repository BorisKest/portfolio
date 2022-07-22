import 'package:flutter/material.dart';
import 'package:portfolio/src/practice/firebase/widgets/small_product_card.dart';

List<String> images = [];

class EShopHomePage extends StatefulWidget {
  const EShopHomePage({Key? key}) : super(key: key);

  @override
  State<EShopHomePage> createState() => _EShopHomePageState();
}

class _EShopHomePageState extends State<EShopHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              margin: const EdgeInsets.fromLTRB(50, 5, 5, 5),
              child: const Icon(Icons.search)),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 2, 10, 10),
              child: TextField(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 35, 20, 10),
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  borderRadius: BorderRadius.circular(50),
                  child: const Placeholder(color: Colors.green),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      'Trending now',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('See all'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SmallProductCard(image: image, title: title, price: price),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
