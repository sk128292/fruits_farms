import 'package:flutter/material.dart';

class Lychee extends StatelessWidget {
  const Lychee({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ItemCard(
            img: "assets/c.jpg",
            title: "Lychee",
            desc: "",
            press: (){},
          ),
          ItemCard(
            img: "assets/c.jpg",
            title: "Lychee",
            desc: "",
            press: (){},
          ),
          ItemCard(
            img: "assets/c.jpg",
            title: "Lychee",
            desc: "",
            press: (){},
          ),
          ItemCard(
            img: "assets/c.jpg",
            title: "Lychee",
            desc: "",
            press: (){},
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String title, desc, img;
  final Function press;

  const ItemCard({Key key, this.title, this.desc, this.img, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 5, right: 5, top: 7, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        // color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.orange[700],
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage(img), 
                      height: 185,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.orange[700]),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}