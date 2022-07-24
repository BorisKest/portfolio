class Product {
  final String descripton;
  final String image;
  final String name;
  final String price;
  final int rate;

  Product({
    required this.descripton,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
  });

  factory Product.fromRTDB(Map<String, dynamic> data) {
    return Product(
      descripton: data['descripton'] ?? 'no data',
      image: data['image'] ?? 'no image',
      name: data['name'] ?? 'no name',
      price: data['price'] ?? 'no price',
      rate: data['rate'] ?? 0,
    );
  }
}
