import 'dart:convert';
import 'package:bhk_buyer_app/screens/homepage_management/dashboard.dart';
import 'package:bhk_buyer_app/screens/orders_management/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../widgets/bottomnavigation.dart';

class InvoiceScreens extends StatefulWidget {
  final List bill;
  const InvoiceScreens({Key? key, required this.bill}) : super(key: key);

  @override
  State<InvoiceScreens> createState() => InvoiceScreenState();
}

class InvoiceScreenState extends State<InvoiceScreens> {
  int _selectedScreenIndex = 3;
  List _screens = [
    {"screen": DashBoard(), "title": "DashBoard"},
    {"screen": OrdersList(), "title": "Orders"},
    // {"screen": (), "title": "My Account"}
  ];
  double? final_price;

  @override
  void initState() {
    super.initState();

    if (widget.bill.isNotEmpty && widget.bill[0]["total"] != null) {
      var price = widget.bill[0]["total"] * 0.18;
      final_price = widget.bill[0]["total"] + price;
    } else {
      // Provide a default value if bill data is not available
      final_price = 0;
    }
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => _screens[_selectedScreenIndex]["screen"]),
    );
  }

  String smallSentence(String bigSentence) {
    if (bigSentence.length > 15) {
      return bigSentence.substring(0, 15) + '.....';
    } else {
      return bigSentence;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.bill);
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              "Invoice Details".toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Customer Name: ${widget.bill[0]["users"]["name"]} ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Customer Address: ${widget.bill[0]["address_id"]}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Order Number: ${widget.bill[0]["order_id"]}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                "Order Summary",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Divider(),
              ListView.builder(
                  shrinkWrap: true,

                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.bill[0]["cart_items"].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(widget.bill[0]
                                                  ["cart_items"][index]
                                              ["image_url"]),
                                          fit: BoxFit.fill)),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Text(
                                      "   ${smallSentence(widget.bill[0]["cart_items"][index]["product_name"])}"
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),

                                    Text(
                                      "    ₹${widget.bill[0]["cart_items"][index]["price"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          height: 20,
                          thickness: 0.15,
                          endIndent: 0,
                          color: Colors.black,
                        ),
                      ]),
                    );
                  }),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Total: ${widget.bill[0]["total"]} ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "GST: 18% ",
                        style: TextStyle(fontSize: 16),
                      ),
                      // Text(
                      //   "Discount: ",
                      //   style: TextStyle(fontSize: 16),
                      // ),
                      SizedBox(height: 12),
                      Text(
                        "Final Price: ${final_price} ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              // ElevatedButton(
              //   onPressed: () async {},
              //   child: Text("Download Invoice"),
              // ),
            ],
          ),
        ),
        bottomNavigationBar: BottomMenu(
          selectedIndex: _selectedScreenIndex,
          onClicked: _selectScreen,
        ),
      ),
    );
  }
}
