import 'package:flutter/foundation.dart';

class CartItem {
  final String id, name, image, description, unit, type;
  final int price, qty;

  CartItem(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.unit,
      this.type,
      this.price,
      this.qty});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.qty;
    });
    return total;
  }

  void addItem(String id, String name, int price, String image, String type,
      String unit, int qty) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                name: existingCartItem.name,
                unit: existingCartItem.unit,
                qty: existingCartItem.qty + 1,
                image: existingCartItem.image,
                type: existingCartItem.type,
                price: existingCartItem.price,
              ));
    } else {
      _items.putIfAbsent(
          id,
          () => CartItem(
                name: name,
                id: id,
                unit: unit,
                qty: qty,
                price: price,
                image: image,
                type: type,
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
          price: existingCartItem.price,
          image: existingCartItem.image,
          unit: existingCartItem.unit,
          type: existingCartItem.type,
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
