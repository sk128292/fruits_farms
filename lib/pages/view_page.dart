import 'package:flutter/material.dart';
import 'package:fruits_farms/models/cart.dart';
import 'package:fruits_farms/pages/cartpage.dart';
import 'package:fruits_farms/pages/homepage.dart';
import 'package:provider/provider.dart';

class ViewPage extends StatefulWidget {
  ViewPage({Key key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruits Farms"),
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
                    cart.items.length == 0
                        ? Container()
                        : Positioned(
                            left: 18,
                            bottom: 8,
                            child: CircleAvatar(
                              radius: 7.0,
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              child: Text(
                                cart.items.length.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(30.0),
        //   child: Expanded(
        //     child: Padding(
        //       padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
        //       child: TextField(
        //         decoration: InputDecoration(
        //           contentPadding: EdgeInsets.all(5),
        //           prefixIcon: Icon(Icons.search),
        //           hintText: "Search here...",
        //           border: OutlineInputBorder(),
        //           filled: true,
        //           fillColor: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("username lading..."),
              accountEmail: Text("email loading..."),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('SK'),
              ),
            ),
            ListTile(
              title: Text('Account'),
              leading: Icon(Icons.account_circle),
              onTap: null,
            ),
            ListTile(
              title: Text('My Order'),
              leading: Icon(Icons.shopping_basket),
              onTap: null,
            ),
            ListTile(
              title: Text('About Us'),
              leading: Icon(Icons.book),
              onTap: () {},
            ),
            ListTile(
              title: Text('Help'),
              leading: Icon(Icons.help),
              onTap: () {},
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.settings_power),
              onTap: () {
                // AuthService().signOut();
              },
            ),
          ],
        ),
      ),
      body: HomePage(),
    );
  }
}
