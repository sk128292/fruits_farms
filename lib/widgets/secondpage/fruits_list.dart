import 'package:flutter/material.dart';
import 'package:fruits_farms/models/cart.dart';
import 'package:fruits_farms/models/product.dart';
import 'package:fruits_farms/pages/detailpage.dart';
import 'package:provider/provider.dart';

class FruitsList extends StatefulWidget {
  FruitsList({Key key}) : super(key: key);

  @override
  _FruitsListState createState() => _FruitsListState();
}

class _FruitsListState extends State<FruitsList> {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: false);
    final proData = productData.findFruits;
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: proData.length,
        itemBuilder: (BuildContext context, int index) {
          return FruitList(
            id: proData[index].id,
            name: proData[index].name,
            description: proData[index].description,
            type: proData[index].type,
            image: proData[index].image,
            unit: proData[index].unit,
            category: proData[index].category,
            price: proData[index].price,
            qty: proData[index].qty,
          );
        },
      ),
    );
  }
}

class FruitList extends StatefulWidget {
  final String id, name, description, type, image, unit, category;
  final int qty, price;

  FruitList(
      {Key key,
      this.id,
      this.name,
      this.description,
      this.type,
      this.image,
      this.unit,
      this.category,
      this.price,
      this.qty})
      : super(key: key);
  @override
  _FruitListState createState() => _FruitListState();
}

class _FruitListState extends State<FruitList> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      height: 120,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(DetailPage.routeName, arguments: widget.id);
          },
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 130,
                child: Image.asset(widget.image, fit: BoxFit.cover),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(widget.name + " " + " " + widget.type,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.unit,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Price: " + widget.price.toString()),
                          if (cart.items.containsKey(widget.id))
                            MaterialButton(
                              minWidth: 70,
                              color: Colors.red[400],
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('Item Removed from Cart'),
                                ));
                                cart.removeItem(widget.id);
                              },
                              child: Text(
                                "Remove",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          else
                            MaterialButton(
                              minWidth: 70,
                              color: Colors.lightGreen,
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('Item Added to Cart'),
                                ));
                                cart.addItem(
                                    widget.id,
                                    widget.name,
                                    widget.price,
                                    widget.image,
                                    widget.type,
                                    widget.unit,
                                    widget.qty);
                              },
                              child: Text('Add'),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
