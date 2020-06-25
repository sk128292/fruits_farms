import 'package:flutter/material.dart';
import 'package:fruits_farms/widgets/ad.dart';

class CategoryLoadPage extends StatelessWidget {
  const CategoryLoadPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: AppBar(
        title: Text('Fruits'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          alignment: Alignment.centerLeft,
          tooltip: "Back",
          onPressed: (){ Navigator.pop(context);},
        ),
      ),
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          children: <Widget>[
            Advertise(),
            Container(
              height: 300,
              child: Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    GridTile(
                      child: Image(
                        image: AssetImage('assets/b.jpg')
                      ),
                    ),
                    GridTile(
                      child: Image(
                        image: AssetImage('assets/b.jpg')
                      ),
                    ),
                    GridTile(
                      child: Image(
                        image: AssetImage('assets/b.jpg')
                      ),
                    ),
                    GridTile(
                      child: Image(
                        image: AssetImage('assets/b.jpg')
                      ),
                    ),
                    GridTile(
                      child: Image(
                        image: AssetImage('assets/b.jpg')
                      ),
                    ),
                    GridTile(
                      child: Image(
                        image: AssetImage('assets/b.jpg')
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Advertise(),
            Advertise(),
          ],
        ),
      ),
    );
  }
}