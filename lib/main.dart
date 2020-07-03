import 'package:flutter/material.dart';
import 'package:fruits_farms/models/cart.dart';
import 'package:fruits_farms/models/category.dart';
import 'package:fruits_farms/models/product.dart';
import 'package:fruits_farms/pages/cartpage.dart';
import 'package:fruits_farms/pages/detailpage.dart';
import 'package:fruits_farms/pages/view_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Categories()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          canvasColor: Colors.grey[200],
        ),
        home: ViewPage(),
        routes: {
          DetailPage.routeName: (ctx) => DetailPage(),
          CartPage.routeName: (ctx) => CartPage(),
        },
      ),
    );
  }
}
