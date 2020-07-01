import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id, name, category, description, grade, image;
  final int price, qty;

  Product(
      {this.id,
      this.name,
      this.category,
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
      category: 'fruits',
      description: 'Apple is good for helth',
      grade: 'Grade A',
      image: 'assets/apple.jpg',
      price: 50,
      qty: 20,
    ),
    Product(
      id: '2',
      category: 'fruits',
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
      category: 'fruits',
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

  List<Product> get findFruits {
    return _items.where((fruit) => fruit.category == 'fruits').toList();
  }

  List<Product> get findVegitable {
    return _items.where((veg) => veg.category == 'vegetable').toList();
  }
}
