import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portfolio/src/practice/firebase/e-shop/product_page.dart/product_page.dart';

class GridCard extends StatelessWidget {
  final Color? color;
  final String image;
  final String text;
  final int productId;

  const GridCard({
    Key? key,
    this.color,
    required this.image,
    required this.text,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: color ?? Colors.white),
        ),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: Column(
            children: [
              Image.asset(image),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(text, style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductPage(),
          ),
        );
      },
    );
  }
}
