import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Fruit Farms..'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          alignment: Alignment.centerLeft,
          tooltip: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Image(image: AssetImage('assets/commingsoon.png')),
      ),
    );
  }
}
