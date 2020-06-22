import 'package:flutter/material.dart';
import 'package:fruits_farms/pages/view_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        canvasColor: Colors.grey[350]
      ),
      home: ViewPage(),
    );
  }
}
