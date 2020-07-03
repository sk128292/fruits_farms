import 'package:flutter/material.dart';
import 'package:fruits_farms/models/product.dart';
import 'package:fruits_farms/pages/cartpage.dart';
import 'package:fruits_farms/widgets/categoires.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  // DetailPage({Key key}) : super(key: key);

  static const routeName = '/product-detail';

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPrdct = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruits Farms"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          alignment: Alignment.centerLeft,
          tooltip: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
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
                      padding: EdgeInsets.only(
                        bottom: 5,
                      ),
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.lightGreen[50],
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartPage()));
                      },
                    ),
                    // cart.items.length == 0 ? Container() :
                    Positioned(
                      left: 18,
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
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.lightBlue[50],
                Colors.lightBlue[100],
                Colors.orange[300],
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage(loadedPrdct.image), fit: BoxFit.fill),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Center(
                        child: Text(
                          loadedPrdct.type,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            loadedPrdct.qty.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Price " + loadedPrdct.price.toString(),
                            style: TextStyle(
                                color: Colors.orange[700],
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          // if (cart.items.containsKey(loadedPrdct.id))
                          // MaterialButton(
                          //   color: Colors.red[400],
                          //   onPressed: () {
                          //     // cart.removeItem(loadedPrdct.id);
                          //     // _displayRemoveSnackBar(context);
                          //   },
                          //   child: Text("Remove",
                          //       style: TextStyle(color: Colors.white)),
                          // )
                          // else
                          MaterialButton(
                            color: Colors.lightGreen,
                            onPressed: () {
                              // cart.addItem(loadedPrdct.id, loadedPrdct.name, loadedPrdct.price, loadedPrdct.image, loadedPrdct.qty);

                              // _displayAddSnackBar(context);
                            },
                            child: Text("Add To Cart"),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 20),
                      child: ListTile(
                        title: Text(
                          loadedPrdct.name + " " + loadedPrdct.type,
                        ),
                        subtitle: Text(
                          loadedPrdct.description,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 15, bottom: 15),
                child: SizedBox(
                  child: Text(
                    "Similar Products",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              CategoriesItem(),
            ],
          ),
        ),
      ),
    );
  }
}
