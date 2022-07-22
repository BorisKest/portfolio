import 'package:flutter/material.dart';
import 'package:portfolio/src/practice/firebase/widgets/pet_card.dart';
import 'package:portfolio/src/practice/firebase/widgets/small_product_card.dart';

List<String> imagesDogs = [
  'assets/images/pets/dog1.jpg',
  'assets/images/pets/dog2.jpg',
  'assets/images/pets/dog3.jpg',
  'assets/images/pets/dog4.jpg',
  'assets/images/pets/dog5.jpg',
  'assets/images/pets/dog6.jpg',
  'assets/images/pets/dog7.jpg',
  'assets/images/pets/dog8.jpg',
  'assets/images/pets/dog_food1.jpg',
  'assets/images/pets/dog_food2.jpg',
  'assets/images/pets/dog_food3.jpg',
];
List<String> imagesCats = [
  'assets/images/pets/cat1.jpg',
  'assets/images/pets/cat2.jpg',
  'assets/images/pets/cat3.jpg',
  'assets/images/pets/cat_food1.jpg',
  'assets/images/pets/cat_food2.jpg',
];

List<String> title = [
  'Free puppy socialisation in store',
  'Eco-friendly toys your dog will love',
  'Pacage of dog food',
];

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
                margin: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 10.0),
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  borderRadius: BorderRadius.circular(50),
                  child: const Placeholder(color: Colors.green),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                      'Trending now',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('See all'),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      SmallProductCard(
                          image: imagesDogs[0], title: title[0], price: 'Free'),
                      SmallProductCard(
                          image: imagesDogs[1], title: title[1], price: 'Free'),
                      SmallProductCard(
                          image: imagesDogs[2], title: title[2], price: 'Free'),
                      SmallProductCard(
                          image: imagesDogs[3], title: title[1], price: 'Free'),
                    ],
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0),
                child: Row(
                  children: const [
                    Text('Browse pet types'),
                    Spacer(),
                    Text('See all'),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      PetCard(
                        image: 'assets/images/pets/dog_type.png',
                        title: 'Dog',
                      ),
                      PetCard(
                        image: 'assets/images/pets/cat_type.png',
                        title: 'Cat',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
