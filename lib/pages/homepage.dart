import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:fruits_farms/pages/fruitspage.dart';
import 'package:fruits_farms/pages/test_page.dart';
import 'package:fruits_farms/pages/vegetablepage.dart';
import 'package:fruits_farms/widgets/ad.dart';
import 'package:fruits_farms/widgets/homepage/apple.dart';
import 'package:fruits_farms/widgets/categoires.dart';
import 'package:fruits_farms/widgets/comingsoon.dart';
import 'package:fruits_farms/widgets/homepage/mango.dart';

enum CategoryName {
  apple,
  orange,
  mango,
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoryName _selectedCategory = CategoryName.apple;

  @override
  Widget build(BuildContext context) {
    // Provider.of<Product>(context);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Advertise(),
            // TestScreen(),
            Container(
              height: 190,
              child: Carousel(
                boxFit: BoxFit.cover,
                images: [
                  AssetImage('assets/a.jpg'),
                  AssetImage('assets/grapesbanner.jpg'),
                  AssetImage('assets/lycheebanner.jpg'),
                  AssetImage('assets/pearsbanner.jpg'),
                  AssetImage('assets/vegetablesbanner.jpg'),
                ],
                dotSize: 4.0,
                // dotSpacing: 15.0,
                dotColor: Colors.pink[300],
                indicatorBgPadding: 5.0,
                autoplay: true,
                autoplayDuration: Duration(seconds: 8),
                animationCurve: Curves.easeIn,
                animationDuration: Duration(seconds: 2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "Choose Product",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  CategoriesItem(),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Find By Cateogry",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FruitsPage()));
                            },
                            child: Column(
                              children: <Widget>[
                                Image(
                                  height: 130,
                                  image: AssetImage('assets/fruits.jpg'),
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Fruites",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VegetablePage()));
                            },
                            child: Column(
                              children: <Widget>[
                                Image(
                                  height: 130,
                                  image: AssetImage('assets/vegetables.jpg'),
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Vegitables",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/a.jpg"), fit: BoxFit.fill),
                ),
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'What You Need..',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Container(
                      height: 40,
                      child: ListView(
                        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: MaterialButton(
                              minWidth: 150,
                              onPressed: () {
                                setState(() =>
                                    _selectedCategory = CategoryName.apple);
                              },
                              child: Text('Apple'),
                              color: _selectedCategory == CategoryName.apple
                                  ? (Colors.red)
                                  : (Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: MaterialButton(
                              minWidth: 150,
                              onPressed: () {
                                setState(() =>
                                    _selectedCategory = CategoryName.orange);
                              },
                              child: Text('Orange'),
                              color: _selectedCategory == CategoryName.orange
                                  ? (Colors.red)
                                  : (Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: MaterialButton(
                              minWidth: 150,
                              onPressed: () {
                                setState(() =>
                                    _selectedCategory = CategoryName.mango);
                              },
                              child: Text('Mango'),
                              color: _selectedCategory == CategoryName.mango
                                  ? (Colors.red)
                                  : (Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: categoryItemsLoad(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Dry Fruits',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contecx) => ComingSoon()));
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 200,
                        width: double.infinity,
                        image: AssetImage('assets/dryfruits.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Advertise(),
            Container(
              width: double.infinity,
              height: 60,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Thanking You..",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryItemsLoad() {
    switch (_selectedCategory) {
      case CategoryName.apple:
        return Apple();
        break;
      case CategoryName.orange:
        return Mango();
        break;
      case CategoryName.mango:
        return Mango();
        break;
      default:
    }
    return null;
  }
}
