import 'package:flutter/material.dart';
import 'package:fruits_farms/models/product.dart';
import 'package:fruits_farms/pages/detailpage.dart';
import 'package:provider/provider.dart';

class Mango extends StatelessWidget {
  const Mango({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: false);
    final prdcts = productData.findMango;
    return Container(
      height: 237,
      child: prdcts.length != 0
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              itemCount: prdcts.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: prdcts[index],
                child: CategoryItem(
                  id: prdcts[index].id,
                  name: prdcts[index].name,
                  image: prdcts[index].image,
                  price: prdcts[index].price,
                  qty: prdcts[index].qty,
                  type: prdcts[index].type,
                ),
              ),
            )
          : Center(
              child: Image(
                height: 230,
                image: AssetImage('assets/commingsoon.png'),
              ),
            ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String id, name, description, type, image;
  final int qty, price;

  const CategoryItem(
      {Key key,
      this.id,
      this.name,
      this.description,
      this.type,
      this.image,
      this.price,
      this.qty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          color: Colors.grey,
          child: Container(
            color: Colors.transparent,
            // margin: EdgeInsets.only(left: 2, right: 5, top: 7, bottom: 5),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(DetailPage.routeName, arguments: id);
                },
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 145,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 145,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(qty.toString()),
                                  Text("Rs. " + price.toString(),
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 15)),
                                ],
                              ),
                              // Divider(color:Colors.red,),
                              MaterialButton(
                                minWidth: 130,
                                color: Colors.lightGreen,
                                onPressed: () {},
                                child: Text('Add'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          width: 153,
          bottom: 73.0,
          height: 40,
          // left: 0.0,
          // right: 1.0,
          child: Card(
            color: Colors.black.withOpacity(0.37),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
              ),
              child: Text(
                type,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
