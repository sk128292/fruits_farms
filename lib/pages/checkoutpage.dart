import 'package:flutter/material.dart';
import 'package:fruits_farms/models/cart.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;

  int radioValue = 0;
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          alignment: Alignment.centerLeft,
          tooltip: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: cart.items.length != 0
          ? Container(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Payble Amount:  " + cart.totalAmount.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.orange[500],
                      onPressed: () {},
                      child: Text(
                        "Pay",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              color: Colors.white,
              child: Text(""),
            ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Delivery Address",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 5, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sandeep Kumar",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Edit ",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.red,
                                  )),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text("203, 2nd floor"),
                      Text("Jamun Gali Mahavir Enclave"),
                      Text("Near Jamun Gali "),
                      Text("Delhi 110045"),
                      Text("9931946301"),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Payment Options",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 264.0,
              // margin: EdgeInsets.all(10.0),
              child: Card(
                child: Container(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Wallet / UPI",
                                maxLines: 10,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                              Radio<int>(
                                  value: 1,
                                  groupValue: radioValue,
                                  onChanged: handleRadioValueChanged),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Net Banking",
                                maxLines: 10,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                              Radio<int>(
                                  value: 2,
                                  groupValue: radioValue,
                                  onChanged: handleRadioValueChanged),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Credit / Debit / ATM Card",
                                maxLines: 10,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                              Radio<int>(
                                  value: 3,
                                  groupValue: radioValue,
                                  onChanged: handleRadioValueChanged),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Cash on Delivery",
                                maxLines: 10,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                              Radio<int>(
                                  value: 4,
                                  groupValue: radioValue,
                                  onChanged: handleRadioValueChanged),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
