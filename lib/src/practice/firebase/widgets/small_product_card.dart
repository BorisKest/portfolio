import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallProductCard extends StatelessWidget {
  String image;
  String title;
  String price;

  SmallProductCard({
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(image),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(title),
          ),
          Text(price),
        ],
      ),
    );
  }
}
