import 'dart:collection';
import 'package:flutter/cupertino.dart';

class Test {
  String id;
  String name;
  String category;
  String detailName;
  String description;
  String unit;
  String image;
  double price;
  int qty;

  Test.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    detailName = data['detailName'];
    description = data['description'];
    unit = data['unit'];
    image = data['image'];
    price = data['price'];
    qty = data['qty'];
  }
}

class TestNotifier with ChangeNotifier {
  List<Test> _testList = [];
  Test _currentTest;

  UnmodifiableListView<Test> get testList => UnmodifiableListView(_testList);

  Test get currentTest => _currentTest;

  set testList(List<Test> testList) {
    _testList = testList;
    notifyListeners();
  }

  set currentTest(Test test) {
    _currentTest = test;
    notifyListeners();
  }
}
