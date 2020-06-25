import 'package:flutter/material.dart';

class Mango extends StatelessWidget {
  const Mango({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          CategoryItem(
            img: "assets/mango.jpg",
            title: "Mango Malda",
            price: 100,
            qty: 2,
            desc: "",
            press: (){},
          ),
          CategoryItem(
            img: "assets/mango.jpg",
            title: "Mango Sindura",
            qty: 2,
            price: 200,
            desc: "",
            press: (){},
          ),
          CategoryItem(
            img: "assets/mango.jpg",
            title: "Mango Dashahri",
            price: 300,
            qty: 5,
            desc: "",
            press: (){},
          ),
          CategoryItem(
            img: "assets/mango.jpg",
            title: "Mango",
            price: 400,
            qty: 5,
            desc: "",
            press: (){},
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title, desc, img;
  final Function press;
  final int price, qty;

  const CategoryItem({Key key, this.title, this.desc, this.img, this.press, this.price, this.qty}) : super(key: key);

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
                onTap: press,
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
                            image: AssetImage(img),                           
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
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(qty.toString()+' box'),
                                  Text("Rs. "+price.toString(), style: TextStyle(color: Colors.red, fontSize: 15)),
                                ],
                              ),
                              // Divider(color:Colors.red,),
                              MaterialButton(
                                minWidth: 130,
                                color: Colors.lightGreen,
                                onPressed: (){},
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
              padding: const EdgeInsets.only(top:5.0,),
              child: Text(title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15),),
            ),
          ),
        ),
      ],
    );
  }
}