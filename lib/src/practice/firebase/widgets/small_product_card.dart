import 'package:flutter/material.dart';

class SmallProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const SmallProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).canvasColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 180,
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(10),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    image,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(title),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Text(
                price,
                style: const TextStyle(color: Colors.white12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
