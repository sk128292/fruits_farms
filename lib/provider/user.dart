// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fruits_farms/models/user.dart';
// import 'package:fruits_farms/services/users.dart';

// enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

// class UserProvider with ChangeNotifier {
//   FirebaseAuth _auth;
//   FirebaseUser _user;
//   Status _status = Status.Uninitialized;
//   Firestore _firestore = Firestore.instance;
//   UserServices _userServices = UserServices();
//   UserModel _userModel;

// //  getter
//   UserModel get userModel => _userModel;

//   Status get status => _status;

//   FirebaseUser get user => _user;

//   final formkey = GlobalKey<FormState>();

//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController name = TextEditingController();

//   UserProvider.initialize() : _auth = FirebaseAuth.instance {
//     _auth.onAuthStateChanged.listen(_onStateChanged);
//   }

//   Future<bool> signIn() async {
//     try {
//       _status = Status.Authenticating;
//       notifyListeners();
//       await _auth.signInWithEmailAndPassword(
//           email: email.text.trim(), password: password.text.trim());
//       return true;
//     } catch (e) {
//       _status = Status.Unauthenticated;
//       notifyListeners();
//       print(e.toString());
//       return false;
//     }
//   }

//   Future<bool> signUp() async {
//     try {
//       _status = Status.Authenticating;
//       notifyListeners();
//       await _auth
//           .createUserWithEmailAndPassword(
//               email: email.text.trim(), password: password.text.trim())
//           .then((result) {
//         _firestore.collection('users').document(result.user.uid).setData({
//           'name': name.text,
//           'email': email.text,
//           'uid': result.user.uid,
//         });
//       });
//       return true;
//     } catch (e) {
//       _status = Status.Unauthenticated;
//       notifyListeners();
//       print(e.toString());
//       return false;
//     }
//   }

//   Future signOut() async {
//     _auth.signOut();
//     _status = Status.Unauthenticated;
//     notifyListeners();
//     return Future.delayed(Duration.zero);
//   }

//   void clearController() {
//     name.text = "";
//     password.text = "";
//     email.text = "";
//   }

//   Future<void> reloadUserModel() async {
//     _userModel = await _userServices.getUserById(user.uid);
//     notifyListeners();
//   }

//   Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
//     if (firebaseUser == null) {
//       _status = Status.Unauthenticated;
//     } else {
//       _user = firebaseUser;
//       _status = Status.Authenticated;
//       _userModel = await _userServices.getUserById(user.uid);
//     }
//     notifyListeners();
//   }

//   // Future<bool> addToCart(
//   //     {ProductModel product, String size, String color}) async {
//   //   try {
//   //     var uuid = Uuid();
//   //     String cartItemId = uuid.v4();
//   //     List<CartItemModel> cart = _userModel.cart;

//   //     Map cartItem = {
//   //       "id": cartItemId,
//   //       "name": product.name,
//   //       "image": product.picture,
//   //       "productId": product.id,
//   //       "price": product.price,
//   //       "size": size,
//   //       "color": color
//   //     };

//   //     CartItemModel item = CartItemModel.fromMap(cartItem);
//   //     if (!itemExists) {
//   //       print("CART ITEMS ARE: ${cart.toString()}");
//   //       _userServices.addToCart(userId: _user.uid, cartItem: item);
//   //     }

//   //     return true;
//   //   } catch (e) {
//   //     print("THE ERROR ${e.toString()}");
//   //     return false;
//   //   }
//   // }

//   // Future<bool> removeFromCart({CartItemModel cartItem}) async {
//   //   print("THE PRODUC IS: ${cartItem.toString()}");

//   //   try {
//   //     _userServices.removeFromCart(userId: _user.uid, cartItem: cartItem);
//   //     return true;
//   //   } catch (e) {
//   //     print("THE ERROR ${e.toString()}");
//   //     return false;
//   //   }
//   // }

//   // getOrders() async {
//   //   orders = await _orderServices.getUserOrders(userId: _user.uid);
//   //   notifyListeners();
//   // }
// }
