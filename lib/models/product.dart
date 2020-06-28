import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id, name, description, grade, image;
  final int price, qty;

  Product(
      {this.id,
      this.name,
      this.description,
      this.grade,
      this.image,
      this.price,
      this.qty});
}

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: '1',
      name: 'Apple',
      description: 'Apple is good for helth',
      grade: 'Grade A',
      image: 'assets/apple.jpg',
      price: 50,
      qty: 20,
    ),
    Product(
      id: '2',
      name: 'Grapes',
      description: 'Grapes is good for helth',
      grade: 'Grade A',
      image: 'assets/grapes.jpg',
      price: 50,
      qty: 20,
    ),
    Product(
      id: '3',
      name: 'Lychee',
      description: 'Lychee is good for helth',
      grade: 'Grade B',
      image: 'assets/lychee.jpg',
      price: 50,
      qty: 20,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }
}
