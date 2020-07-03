import 'package:flutter/material.dart';
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
            category: proData[index].category,
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
  final String id, name, category, description, grade, image;
  final int qty, price;

  AppleList(
      {this.id,
      this.name,
      this.category,
      this.description,
      this.grade,
      this.image,
      this.price,
      this.qty});

  @override
  _AppleListState createState() => _AppleListState();
}

class _AppleListState extends State<AppleList> {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                                "Price: " +
                                    (widget.price - (widget.price / 10))
                                        .toString(),
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15),
                              )
                            ],
                          ),
                          Visibility(
                            visible: _isVisible,
                            child: OutlineButton(
                              borderSide: BorderSide(color: Colors.green),
                              textColor: Colors.green,
                              child: Text("Add"),
                              onPressed: showToast,
                            ),
                            replacement: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.green,
                                  ),
                                  onPressed: null,
                                ),
                                Text("1"),
                                IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Colors.green,
                                  ),
                                  onPressed: null,
                                )
                              ],
                            ),
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
