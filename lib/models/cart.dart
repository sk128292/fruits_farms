import 'package:flutter/foundation.dart';

class CartItem {
  final String id, name, image, description;
  final int price;
  final int qty;

  CartItem(
      {this.id, this.name, this.image, this.description, this.price, this.qty});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String id, String name, int price, String image, int qty) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                name: existingCartItem.name,
                qty: existingCartItem.qty + qty,
                image: existingCartItem.image,
                price: existingCartItem.price + price,
              ));
    } else {
      _items.putIfAbsent(
          id,
          () => CartItem(
                name: name,
                id: id,
                qty: qty,
                price: price,
                image: image,
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id, int qty, int price) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (qty > 1) {
      _items.update(
        id,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          name: existingCartItem.name,
          qty: existingCartItem.qty - 1,
          price: existingCartItem.price - price,
          image: existingCartItem.image,
        ),
      );
    }
    if (qty <= 1) {
      removeItem(id);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
