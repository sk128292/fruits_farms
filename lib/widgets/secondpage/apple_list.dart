import 'package:flutter/material.dart';
import 'package:fruits_farms/models/cart.dart';
import 'package:fruits_farms/models/product.dart';
import 'package:fruits_farms/pages/detailpage.dart';
import 'package:provider/provider.dart';

class ApplesList extends StatefulWidget {
  ApplesList({Key key}) : super(key: key);

  @override
  _ApplesListState createState() => _ApplesListState();
}

class _ApplesListState extends State<ApplesList> {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: false);
    final proData = productData.findApple;
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: proData.length,
        itemBuilder: (BuildContext context, int index) {
          return AppleList(
            id: proData[index].id,
            name: proData[index].name,
            type: proData[index].type,
            image: proData[index].image,
            price: proData[index].price,
            description: proData[index].description,
            qty: proData[index].qty,
          );
        },
      ),
    );
  }
}

class AppleList extends StatefulWidget {
  final String id, name, description, type, image, unit;
  final int qty, price;

  AppleList(
      {Key key,
      this.id,
      this.name,
      this.description,
      this.type,
      this.image,
      this.unit,
      this.price,
      this.qty})
      : super(key: key);

  @override
  _AppleListState createState() => _AppleListState();
}

class _AppleListState extends State<AppleList> {
  @override
  Widget build(BuildContext context) {
    final prdcts = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
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
                width: 125,
                child: Image.asset(widget.image, fit: BoxFit.contain),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(widget.name,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      // Text("Price: " + this.price.toString()),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            // height: 15,
                            width: 190,
                            child: DropdownButton(
                              isExpanded: true,
                              disabledHint: Text(widget.qty.toString()),
                              items: null,
                              onChanged: null,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "Mrp: " + widget.price.toString(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.red,
                                    fontSize: 13),
                              ),
                              Text(
                                "Price: " + (widget.price.toString()),
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15),
                              )
                            ],
                          ),
                          if (cart.items.containsKey(prdcts.id))
                            MaterialButton(
                              minWidth: 145,
                              color: Colors.red[400],
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('Item Removed from Cart'),
                                ));
                                cart.removeItem(prdcts.id);
                              },
                              child: Text(
                                "Remove",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          else
                            MaterialButton(
                              minWidth: 145,
                              color: Colors.lightGreen,
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('Item Added to Cart'),
                                ));
                                cart.addItem(
                                    prdcts.id,
                                    prdcts.name,
                                    prdcts.price,
                                    prdcts.image,
                                    prdcts.type,
                                    prdcts.unit,
                                    prdcts.qty);
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
