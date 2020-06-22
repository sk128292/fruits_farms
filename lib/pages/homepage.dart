import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:fruits_farms/widgets/category.dart';
import 'package:fruits_farms/widgets/category_name.dart';
import 'package:fruits_farms/widgets/lychee.dart';

enum CategoryName {apple, orange, kinoo, mango, lychee, kiwi}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  CategoryName _selectedCategory = CategoryName.apple;
  
  @override
  Widget build(BuildContext context) {
    return Container(
       child: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             Container(
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                   colors: [Colors.lightBlue[100],Colors.lightGreen[100]],
                   stops: [0.3, 1]
                  ),
               ),
               child: Card(
                 color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Welcome to Fruits Farms", style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold ),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Where Every Product is Organic", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold ),)
                          ],
                        ),
                      ],
                    ),
                  )
                ),
             ),
             Container(
              height: 190,
              child: Carousel(
                boxFit: BoxFit.cover,
                images: [
                  AssetImage('assets/apple.jpg'),
                  AssetImage('assets/grapes.jpg'),
                  AssetImage('assets/lychee.jpg'),
                  AssetImage('assets/pears.jpg'),
                  AssetImage('assets/strawberry.jpg'),
                ],
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Colors.pink[300],
                indicatorBgPadding: 5.0,
                autoplay: true,
                autoplayDuration: Duration(seconds: 5),
                animationCurve: Curves.ease,
                animationDuration: Duration(seconds: 2),
              ),
             ),
             Container(
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                   colors: [Colors.transparent, Colors.transparent],
                  //  stops: [0.3, 1]
                  ),
               ),
               child: Card(
                //  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Shop By Category", style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold ),)
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: <Widget>[
                        //     Text("Where Every Product is Organic", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold ),)
                        //   ],
                        // ),
                      ],
                    ),
                  )
                ),
             ),
             Column(
               children: <Widget>[
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
                             onPressed: (){
                               setState(() => _selectedCategory = CategoryName.apple);
                             },
                             child: Text('Apple'),
                             color: _selectedCategory == CategoryName.apple ? (Colors.red) : (Colors.grey),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                           child: MaterialButton(
                             onPressed: (){
                               setState(() => _selectedCategory = CategoryName.orange);
                             },
                             child: Text('Orange'),
                             color: _selectedCategory == CategoryName.orange ? (Colors.red) : (Colors.grey),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                           child: MaterialButton(
                             onPressed: (){
                               setState(() => _selectedCategory = CategoryName.kinoo);
                             },
                             child: Text('Kinoo'),
                             color: _selectedCategory == CategoryName.kinoo ? (Colors.red) : (Colors.grey),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                           child: MaterialButton(
                             onPressed: (){
                               setState(() => _selectedCategory = CategoryName.mango);
                             },
                             child: Text('Mango'),
                             color: _selectedCategory == CategoryName.mango ? (Colors.red) : (Colors.grey),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                           child: MaterialButton(
                             onPressed: (){
                               setState(() => _selectedCategory = CategoryName.lychee);
                             },
                             child: Text('Lychee'),
                             color: _selectedCategory == CategoryName.lychee ? (Colors.red) : (Colors.grey),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                           child: MaterialButton(
                             onPressed: (){
                               setState(() => _selectedCategory = CategoryName.kiwi);
                             },
                             child: Text('Kiwi'),
                             color: _selectedCategory == CategoryName.kiwi ? (Colors.red) : (Colors.grey),
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

             SizedBox(
               height:8,
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 Expanded(
                   child: Card(
                     clipBehavior: Clip.antiAliasWithSaveLayer,
                     child: Column(
                       children: <Widget>[
                         Image(
                           height: 130,
                           image: AssetImage('assets/strawberry.jpg'),
                           fit: BoxFit.fill,
                          ),
                         Padding(
                           padding: EdgeInsets.all(10),
                           child: Text("Apple", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                         ),
                       ],
                     ),
                   ),
                  ),
                  Expanded(
                   child: Card(
                     clipBehavior: Clip.antiAliasWithSaveLayer,
                     child: Column(
                       children: <Widget>[
                         Image(
                           height: 130,
                           image: AssetImage('assets/strawberry.jpg'),
                           fit: BoxFit.fill,
                         ),
                         Padding(
                           padding: EdgeInsets.all(10),
                           child: Text("Lychee", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                         ),
                       ],
                     ),
                   ),
                  ),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 Expanded(
                   child: Card(
                     clipBehavior: Clip.antiAliasWithSaveLayer,
                     child: Column(
                       children: <Widget>[
                         Image(
                           height: 130,
                           image: AssetImage('assets/strawberry.jpg'),
                           fit: BoxFit.fill,
                          ),
                         Padding(
                           padding: EdgeInsets.all(10),
                           child: Text("Apple", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                         ),
                       ],
                     ),
                   ),
                  ),
                  Expanded(
                   child: Card(
                     clipBehavior: Clip.antiAliasWithSaveLayer,
                     child: Column(
                       children: <Widget>[
                         Image(
                           height: 130,
                           image: AssetImage('assets/strawberry.jpg'),
                           fit: BoxFit.fill,
                         ),
                         Padding(
                           padding: EdgeInsets.all(10),
                           child: Text("Lychee", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                         ),
                       ],
                     ),
                   ),
                  ),
               ],
             ),
             SizedBox(
               height:10,
             ),
             SizedBox(
               child: InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (contecx)=>Categories()));
                 },
                 child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    height: 200,
                    width: double.infinity,
                    image: AssetImage('assets/strawberry.jpg'),
                    fit: BoxFit.cover,
                    ),
                  ),
                )
              ),
           ],
         ),
       ),
    );
  }

  Widget categoryItemsLoad(){
    switch (_selectedCategory) {
      case CategoryName.apple:
        return RecentItem();
        break;
      case CategoryName.orange:
        return RecentItem();
        break;
      case CategoryName.kinoo:
        return RecentItem();
        break;
      case CategoryName.mango:
        return RecentItem();
        break;
      case CategoryName.lychee:
        return Lychee();
        break;
      case CategoryName.kiwi:
        return RecentItem();
        break;
      default:
    }
    return null;
  }

}

