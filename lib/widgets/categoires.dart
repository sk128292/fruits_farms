import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          CategoryItem(
            img: "assets/a.jpg",
            title: "Apple",
            desc: "",
            press: (){},
          ),
          CategoryItem(
            img: "assets/b.jpg",
            title: "Grapes",
            desc: "",
            press: (){},
          ),
          CategoryItem(
            img: "assets/c.jpg",
            title: "Lychee",
            desc: "",
            press: (){},
          ),
          CategoryItem(
            img: "assets/d.jpg",
            title: "Pears",
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

  const CategoryItem({Key key, this.title, this.desc, this.img, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.transparent,
          margin: EdgeInsets.only(left: 2, right: 5, top: 7, bottom: 5),
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(10),
          //   boxShadow: [
          //     BoxShadow(
          //       offset: Offset(0, 4),
          //       blurRadius: 20,
          //       color: Color(0xFFB0CCE1).withOpacity(0.32),
          //     ),
          //   ],
          // ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      width: 130,
                      height: 150,
                      // margin: EdgeInsets.only(bottom: 10),
                      // decoration: BoxDecoration(
                      //   color: Colors.orange[700],
                      //   shape: BoxShape.circle,
                      // ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image(
                          image: AssetImage(img),                           
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.orange[700]),),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          width: 135,
          bottom: 1.0,
          height: 50,
          // left: 0.0,
          // right: 1.0,
          child: Card(
            color: Colors.black.withOpacity(0.37),
            child: Padding(
              padding: const EdgeInsets.only(top:10.0,),
              child: Text(title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),
            ),
          ),
        ),
      ],
    );
  }
}