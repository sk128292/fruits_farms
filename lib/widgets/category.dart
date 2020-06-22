import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  
  final catItems = [
    {
      "name": "Apple",
      "img": "assets/apple.jpg",
      "desc":  "Sandeep",
      "price": 100,
    },
    {
      "name": "Lychee",
      "img": "assets/lychee.jpg",
      "desc": "ffghfg",
      "price": 100
    },
    {
      "name": "Strawberry",
      "img": "assets/strawberry.jpg",
      "desc": "ffghfg",
      "price": 100
    },
    {
      "name": "Strawberry",
      "img": "assets/strawberry.jpg",
      "desc": "ffghfg",
      "price": 100
    },
    {
      "name": "Strawberry",
      "img": "assets/strawberry.jpg",
      "desc": "ffghfg",
      "price": 100
    },
    {
      "name": "Strawberry",
      "img": "assets/strawberry.jpg",
      "desc": "ffghfg",
      "price": 90
    },
    {
      "name": "Grapes",
      "img": "assets/grapes.jpg",
      "desc": "ffghfg",
      "price": 100
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          alignment: Alignment.centerLeft,
          tooltip: "Back",
          onPressed: (){ Navigator.pop(context);},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 100,
              child: Card(
                color: Colors.orange, 
                  child: Text("Sandeep"),
              ),
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: catItems.length,
                itemBuilder: (BuildContext context, int index){
                  return Category(
                    catName: catItems[index]['name'],
                    catImage: catItems[index]['img'],
                    catPrice: catItems[index]["price"],
                    catDescription: catItems[index]["desc"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
      
    
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Categories"),
    //     leading: IconButton(
    //       icon: Icon(Icons.arrow_back), 
    //       alignment: Alignment.centerLeft,
    //       tooltip: "Back",
    //       onPressed: (){ Navigator.pop(context);},
    //     ),
    //   ),
    //   body:GridView.builder(
    //   itemCount: cat_items.length,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
    //   itemBuilder: (BuildContext context, int index){
    //     return Category(
    //       cat_name: cat_items[index]['name'],
    //       cat_img: cat_items[index]['img'],
    //     );
    //   },
    // ),);
}}

class Category extends StatefulWidget {

  final String catName;
  final String catImage;
  final int catPrice;
  final String catDescription;

  Category({this.catName, this.catImage, this.catPrice, this.catDescription});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool _isVisible = true;

  void showToast(){
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(2),
          height: 155,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child:GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail()));
              },
              child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 145,
                  child: Image.asset(widget.catImage, fit: BoxFit.contain),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(widget.catName),
                        Text(widget.catDescription, style:TextStyle(fontWeight: FontWeight.bold)),
                        // Text("Price: " + this.price.toString()),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left:10),
                              // height: 15,
                              width: 190,
                              child: DropdownButton(
                                isExpanded: true,
                                disabledHint: Text(" 5 kg "),
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
                                Text("Mrp: " + widget.catPrice.toString(), style: TextStyle(decoration:TextDecoration.lineThrough, color: Colors.red, fontSize: 13),),
                                Text("Price: " + (widget.catPrice - (widget.catPrice/10)).toString(), style: TextStyle(color: Colors.green, fontSize: 15),)
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
                                icon: Icon(Icons.remove_circle, color: Colors.green,), 
                                onPressed: null,
                              ),
                              Text("1"),
                              IconButton(
                                icon: Icon(Icons.add_circle, color: Colors.green,), 
                                onPressed: null,
                              )
                            ],
                          ),
                        ),
                        
                        // OutlineButton(
                        //   borderSide: BorderSide(color: Colors.green),
                        //   textColor: Colors.green,
                        //   child: Text("Add"),
                        //   onPressed: (){},
                        // ),
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
    // return Card(
    //   child: Hero(
    //     tag: cat_name, 
    //     child: Material(
    //       child: InkWell(
    //         onTap: (){},
    //         child: GridTile(
    //           child: Column(
    //             children: <Widget>[
    //               Image.asset(cat_img),
    //               Text(cat_name),
    //             ],
    //           )
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}