// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fruits_farms/models/product.dart';

// class ProductServices {
//   String collection = "products";
//   Firestore _firestore = Firestore.instance;

//   Future<List<ProductModel>> getProducts() async =>
//       _firestore.collection(collection).getDocuments().then((result) {
//         List<ProductModel> products = [];
//         for (DocumentSnapshot product in result.documents) {
//           products.add(ProductModel.fromSnapshot(product));
//         }
//         return products;
//       });

//   Future<List<ProductModel>> searchProduct({String productName}) {
//     String searchKey = productName[0].toUpperCase() + productName.substring(1);
//     return _firestore
//         .collection(collection)
//         .orderBy("name")
//         .startAt([searchKey + '\uf8ff'])
//         .getDocuments()
//         .then((result) {
//           List<ProductModel> products = [];
//           for (DocumentSnapshot product in result.documents) {
//             products.add(ProductModel.fromSnapshot(product));
//           }
//           return products;
//         });
//   }
// }
