import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_farms/models/test.dart';

getTests(TestNotifier testNotifier) async {
  QuerySnapshot snapshot =
      await Firestore.instance.collection('products').getDocuments();

  List<Test> _testList = [];

  snapshot.documents.forEach((document) {
    Test test = Test.fromMap(document.data);
    _testList.add(test);
  });

  testNotifier.testList = _testList;
}
