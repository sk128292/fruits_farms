import 'package:flutter/material.dart';
import 'package:fruits_farms/pages/homepage.dart';

class ViewPage extends StatefulWidget {
  ViewPage({Key key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruits Farms"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search here...",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      
      drawer: Drawer(
        child: ListView(
          children:<Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Sandeep Kumar"),
              accountEmail: Text("sk128292@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('SK'),
              ),
            ),
            ListTile(
              title: Text('Account'),
              leading: Icon(Icons.account_circle),
              onTap: null,
            ),
            ListTile(
              title: Text('My Order'),
              leading: Icon(Icons.shopping_basket),
              onTap: null,
            ),
            ListTile(
              title: Text('About Us'),
              leading: Icon(Icons.book),
              onTap: (){
              },
            ),
            ListTile(
              title: Text('Help'),
              leading: Icon(Icons.help),
              onTap: (){
              },
            ),
            ListTile(
              title: Text('Login'),
              leading: Icon(Icons.settings_power),
              onTap: (){
              },
            ),
          ],
        ),
      ),
      body: HomePage(),
    );
  }
}