import 'package:flutter/material.dart';
import 'package:fruits_farms/widgets/cart_items.dart';

class CartPage extends StatefulWidget {
  static const routeName = "/cart";
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text("Total: Rs. 500/-"),
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
      ),
      body: CartItems(),
    );
  }
}
