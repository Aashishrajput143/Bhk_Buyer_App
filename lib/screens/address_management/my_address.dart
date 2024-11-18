import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:bhk_buyer_app/screens/address_management/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAddresses extends StatelessWidget {
  const MyAddresses({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(56.0), // AppBar height
              child: Material(
                elevation: 4.0, // Adjust elevation for shadow
                shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
                child: AppBar(
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  iconTheme: const IconThemeData(color: Color(0xFF5D2E17)),
                  title: Text(
                    "My Addresses".toUpperCase(),
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xFF5D2E17)),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border,
                          color: Color(0xFF5D2E17)),
                      onPressed: () {
                        Get.toNamed(RoutesClass.gotoWishlistScreen());
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none,
                          color: Color(0xFF5D2E17)),
                      onPressed: () {
                        Get.toNamed(RoutesClass.gotoNotificationScreen());
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined,
                          color: Color(0xFF5D2E17)),
                      onPressed: () {
                        Get.offAllNamed(RoutesClass.gotoCartScreen());
                      },
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
            body: Container(
                color: Colors.white70,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   child:
                  Container(
                      height: MediaQuery.of(context).size.height * .15,
                      child: Center(
                        child: Text("Please add your address",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )),
                ]))),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Container(
                height: 50,
                width: 230,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                // margin:
                // EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Color.fromARGB(255, 118, 60, 31)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                                  // BorderRadius.zero,
                                  BorderRadius.circular(30)))),
                  child: const Text(
                    'Add New Address',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddAddresses()),
                    );
                  },
                ))));
  }
}
