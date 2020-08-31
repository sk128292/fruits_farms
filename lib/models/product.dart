import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id, name, category, description, type, image, unit;
  final int price, qty;

  Product(
      {this.id,
      this.name,
      this.category,
      this.description,
      this.type,
      this.image,
      this.unit,
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
      type: 'Grade A',
      image: 'assets/apple.jpg',
      unit: '20 kg',
      price: 50000,
      qty: 1,
    ),
    Product(
      id: '2',
      category: 'fruits',
      name: 'Apple',
      description: 'Grapes is good for helth',
      type: 'Kashmir Apple -- A ',
      image: 'assets/grapes.jpg',
      unit: '12 kg',
      price: 50,
      qty: 1,
    ),
    Product(
      id: '3',
      name: 'Apple',
      category: 'fruits',
      description: 'Lychee is good for helth',
      type: 'Grade B',
      image: 'assets/lychee.jpg',
      unit: '5 kg',
      price: 50,
      qty: 1,
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

  List<Product> get findApple {
    return _items.where((fruit) => fruit.name == 'Apple').toList();
  }

  List<Product> get findMango {
    return _items.where((fruit) => fruit.name == 'mango').toList();
  }
}

class ProductChange with ChangeNotifier {
  Map<String, Product> _items = {};

  Map<String, Product> get items {
    return {..._items};
  }
}
