import 'package:flutter/material.dart';
import 'package:fruits_farms/models/cart.dart';
import 'package:fruits_farms/pages/view_page.dart';
import 'package:fruits_farms/widgets/cart_items.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  static const routeName = "/cart";
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          alignment: Alignment.centerLeft,
          tooltip: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: cart.items.length != 0
          ? Container(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Total: Rs. " + cart.totalAmount.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        color: Colors.orange[500],
                        onPressed: () {},
                        child: Text(
                          "Checkout",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              color: Colors.white,
              child: Text(""),
            ),
      body: cart.items.length != 0
          ? CartItems()
          : Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage("assets/shopping_cart.png")),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Your Shopping Cart is empty.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    color: Colors.red[300],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ViewPage()));
                    },
                    child: Text("Start Shopping"),
                  ),
                ],
              ),
            ),
    );
  }
}
