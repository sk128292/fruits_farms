import 'package:flutter/cupertino.dart';

class Categories with ChangeNotifier {
  List<Category> _items = [
    Category(id: '1', name: 'Apple', image: 'assets/a.jpg'),
    Category(id: '2', name: 'Grapes', image: 'assets/b.jpg'),
    Category(id: '3', name: 'Mango', image: 'assets/mango.jpg'),
    Category(id: '4', name: 'Lychee', image: 'assets/c.jpg'),
  ];

  List<Category> get items {
    return [..._items];
  }

  Category findById(String id) {
    return _items.firstWhere((category) => category.id == id);
  }
}

class Category with ChangeNotifier {
  final String id, name, image;
  // final Function press;

  Category({this.id, this.name, this.image});
}
