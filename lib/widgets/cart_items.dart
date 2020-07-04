import 'package:flutter/material.dart';
import 'package:fruits_farms/models/cart.dart';
import 'package:provider/provider.dart';

class CartItems extends StatefulWidget {
  // final String cartName, cartImage, cartDescription;
  // final int cartPrice;
  // final cartQty;
  // CartItems({Key key, this.cartName, this.cartDescription,this.cartImage,this.cartPrice,this.cartQty}) : super(key: key);

  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => CartPrdcts(
              cart.items.values.toList()[index].id,
              cart.items.keys.toList()[index],
              cart.items.values.toList()[index].name,
              cart.items.values.toList()[index].image,
              cart.items.values.toList()[index].unit,
              cart.items.values.toList()[index].type,
              cart.items.values.toList()[index].price,
              cart.items.values.toList()[index].qty,
            ),
          ),
        ),
      ],
    );
  }
}

class CartPrdcts extends StatefulWidget {
  final String id, productId, name, image, unit, type;
  final int price, qty;

  CartPrdcts(this.id, this.productId, this.name, this.image, this.unit,
      this.type, this.price, this.qty);

  @override
  _CartPrdctsState createState() => _CartPrdctsState();
}

class _CartPrdctsState extends State<CartPrdcts> {
  // int unit = 1;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Dismissible(
      key: ValueKey(widget.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        cart.removeItem(widget.productId);
      },
      child: Card(
        color: Colors.grey[300],
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 2),
              width: 105,
              height: 110,
              child: Image.asset(widget.image, fit: BoxFit.fill),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(widget.type,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[700],
                          fontSize: 16,
                        )),
                    Text(widget.name),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          widget.unit + " X " + widget.qty.toString(),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text("Rs: " + (widget.price * widget.qty).toString(),
                            style: TextStyle(
                                color: Colors.orange[700],
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(),
                    Text(
                      "To Remove Slide Right to Left",
                      style: TextStyle(color: Colors.red, fontSize: 8),
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 113, width: 1, color: Colors.red),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                IconButton(
                    // padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.orange[500],
                    ),
                    onPressed: () {
                      cart.removeSingleItem(
                          widget.id, widget.qty, widget.price);
                    }),
                Text(widget.qty.toString()),
                IconButton(
                    // padding: EdgeInsets.all(0),
                    icon: Icon(Icons.add_circle, color: Colors.orange[500]),
                    onPressed: () {
                      cart.addItem(widget.id, widget.name, widget.price,
                          widget.image, widget.type, widget.unit, widget.qty);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
