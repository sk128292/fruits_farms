// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProductModel {
//   static const ID = "id";
//   static const NAME = "name";
//   static const CATEGORY = "category";
//   static const DETAILNAME = "detailName";
//   static const DESCRIPTION = "description";
//   static const UNIT = "unit";
//   static const IMAGE = "id";
//   static const PRICE = "id";
//   static const QTY = "id";

//   String _id;
//   String _name;
//   String _category;
//   String _detailName;
//   String _description;
//   String _unit;
//   String _image;
//   double _price;
//   int _qty;

//   String get id => _id;
//   String get name => _name;
//   String get category => _category;
//   String get detailName => _detailName;
//   String get description => _description;
//   String get unit => _unit;
//   String get image => _image;
//   double get price => _price;
//   int get qty => _qty;

//   ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
//     _id = snapshot.data[ID];
//     _name = snapshot.data[NAME];
//     _category = snapshot.data[CATEGORY];
//     _detailName = snapshot.data[DETAILNAME];
//     _description = snapshot.data[DESCRIPTION];
//     _unit = snapshot.data[UNIT];
//     _image = snapshot.data[IMAGE];
//     _price = snapshot.data[PRICE];
//     _qty = snapshot.data[QTY];
//   }
// }
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
