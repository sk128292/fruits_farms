import 'package:flutter/material.dart';
import 'package:fruits_farms/models/category.dart';
import 'package:provider/provider.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<Categories>(context);
    final catData = categoryData.items;
    // final cat = categoryData.items;
    return Container(
      height: 162,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemCount: catData.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: catData[index],
          child: CategoryItem(
            id: catData[index].id,
            image: catData[index].image,
            name: catData[index].name,
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String id, name, description, grade, image;
  final int price, qty;

  const CategoryItem(
      {Key key,
      this.id,
      this.name,
      this.description,
      this.grade,
      this.image,
      this.price,
      this.qty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final prdct = Provider.of<Product>(context, listen: false);
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
              onTap: () {},
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
                          image: AssetImage(image),
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
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
