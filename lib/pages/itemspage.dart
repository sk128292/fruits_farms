import 'package:flutter/material.dart';
import 'package:fruits_farms/pages/cart.dart';
import 'package:fruits_farms/widgets/ad.dart';
import 'package:fruits_farms/widgets/categoires.dart';
import 'package:fruits_farms/widgets/item_list.dart';

class ItemPage extends StatefulWidget {
  ItemPage({Key key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruits Farms"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          alignment: Alignment.centerLeft,
          tooltip: "Back",
          onPressed: (){ Navigator.pop(context);},
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              // height: 100,
              width: 40,
              child: GestureDetector(
                onTap: null,
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.only(bottom: 5,),
                      icon: Icon(Icons.shopping_cart, color: Colors.lightGreen[50], size: 25,),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage()));
                      },
                    ),
                    // cart.items.length == 0 ? Container() :
                    Positioned(
                      left:18,
                      bottom: 8,
                      child: CircleAvatar(
                        radius: 7.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        // child: Text(cart.items.length.toString(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search here...",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          children: <Widget>[
            Advertise(),
            ItemLists(),
            Padding(
               padding: const EdgeInsets.only(top: 10, bottom: 10),
               child: Column(
                 children: <Widget>[
                   Text("Recomended for You..", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold ),),
                   CategoriesItem(),
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
                      image: AssetImage("assets/a.jpg"),
                      fit: BoxFit.fill
                    ),
                  ),
                 child: InkWell(
                   onTap: (){},
                 ),
               ),
             ),
             Container(
               width: double.infinity,
               height: 60,
               child: Card(
                 child: Padding(
                   padding: const EdgeInsets.only(top: 15.0),
                   child: Text("Thanking You..", textAlign: TextAlign.center, style: TextStyle(color: Colors.red,fontSize: 20, fontWeight: FontWeight.bold,),),
                 ),
               ),
             ),
          ],
        ),
      ),
    );
  }
}
