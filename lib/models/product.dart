import 'package:flutter/foundation.dart';

class Products with ChangeNotifier{
  List<Product> _items = [
    Product(
      id: '1',
      name: 'Apple',
      description: 'Apple is good for helth',
      veriety: [
        'Grade A',
        'Grade B',
        'Grade C',
      ],
      image: [
        'asset/apple.jpg',
        'asset/apple.jpg',
        'asset/apple.jpg',
      ],
      price: 50,
      qty: 20,
    ),
    Product(
      id: '1',
      name: 'Apple',
      description: 'Apple is good for helth',
      veriety: [
        'Grade A',
        'Grade B',
        'Grade C',
      ],
      image: [
        'asset/apple.jpg',
        'asset/apple.jpg',
        'asset/apple.jpg',
      ],
      price: 50,
      qty: 20,
    ),
  ];

  List<Product> get items {
    return _items;
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

}
  
class Product with ChangeNotifier{
  final String id, name, description;
  final List<String> veriety, image;
  final int price, qty;

  Product({this.id, this.name, this.description, this.veriety, this.image, this.price,this.qty});
}
