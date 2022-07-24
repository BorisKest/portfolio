import 'package:firebase_database/firebase_database.dart';
import 'package:portfolio/src/practice/firebase/e-shop/models/products.dart';

class ProductStream {
  final _database = FirebaseDatabase.instance.ref();

  Stream<List<Product>> getProductStream() {
    final productStream = _database
        .child('dogFood')
        .onValue; //change in db to one node for all products
    final streamToPublish = productStream.map((event) {
      Map<String, dynamic> productMap =
          event.snapshot.value as Map<String, dynamic>;

      final productList = productMap.entries.map((element) {
        return Product.fromRTDB(Map<String, dynamic>.from(element.value));
      }).toList();
      return productList;
    });
    return streamToPublish;
  }
}
