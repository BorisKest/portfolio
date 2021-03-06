import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String image;
  final String title;

  const PetCard({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 45, 5),
          child: Row(
            children: [
              Container(
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
