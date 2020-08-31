import 'package:flutter/material.dart';
import 'package:fruits_farms/api/product_api.dart';
import 'package:fruits_farms/models/test.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  void initState() {
    TestNotifier testNotifier =
        Provider.of<TestNotifier>(context, listen: false);
    getTests(testNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TestNotifier testNotifier = Provider.of<TestNotifier>(context);
    return SingleChildScrollView(
      child: Container(
        height: 200,
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.network(testNotifier.testList[index].image),
                title: Text(testNotifier.testList[index].name),
                subtitle: Text(testNotifier.testList[index].price.toString()),
              );
            },
            itemCount: testNotifier.testList.length),
      ),
    );
  }
}
