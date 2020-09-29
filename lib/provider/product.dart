// import 'package:flutter/cupertino.dart';
// import 'package:fruits_farms/models/product.dart';
// import 'package:fruits_farms/services/product.dart';

// class ProductProvider with ChangeNotifier {
//   ProductServices _productServices = ProductServices();
//   List<ProductModel> products = [];
//   List<ProductModel> productsSearched = [];

//   ProductProvider.loadProducts();

//   loadProducts() async {
//     products = await _productServices.getProducts();
//     notifyListeners();
//   }

//   Future search({String productName}) async {
//     productsSearched =
//         await _productServices.searchProduct(productName: productName);
//     notifyListeners();
//   }
// }
