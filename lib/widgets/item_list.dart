import 'package:flutter/material.dart';
import 'package:fruits_farms/pages/detailPage.dart';

class ItemLists extends StatefulWidget {
  ItemLists({Key key}) : super(key: key);

  @override
  _ItemListsState createState() => _ItemListsState();
}

class _ItemListsState extends State<ItemLists> {
  
  final items = [
    {
      "name": "Apple",
      "img": "assets/a.jpg",
      "desc":  "Sandeep",
      "price": 100,
    },
    {
      "name": "Lychee",
      "img": "assets/b.jpg",
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
      "img": "assets/c.jpg",
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
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index){
          return ItemList(
            catName: items[index]['name'],
            catImage: items[index]['img'],
            catPrice: items[index]["price"],
            catDescription: items[index]["desc"],
          );
        },
      ),
    );
  }
}

class ItemList extends StatefulWidget {

  final String catName;
  final String catImage;
  final int catPrice;
  final String catDescription;

  ItemList({this.catName, this.catImage, this.catPrice, this.catDescription});

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
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
          height: 140,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child:GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
              },
              child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 125,
                  child: Image.asset(widget.catImage, fit: BoxFit.contain),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(widget.catName, style:TextStyle(fontWeight: FontWeight.bold)),
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