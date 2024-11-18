import 'package:bhk_buyer_app/common/myUtils.dart';
import 'package:bhk_buyer_app/controller/dashboardcontroller.dart';
import 'package:bhk_buyer_app/data/response/status.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:bhk_buyer_app/screens/homepage_management/banner.dart';
import 'package:bhk_buyer_app/screens/homepage_management/flash_sale.dart';
import 'package:bhk_buyer_app/screens/homepage_management/product.dart';
import 'package:bhk_buyer_app/screens/homepage_management/shop_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());
    return Obx(() => Stack(children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex:
                                6, // Adjust the flex ratio according to your needs
                            child: Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.search_sharp,
                                      color: Color.fromARGB(255, 130, 80, 55)),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Search',
                                          hintStyle:
                                              TextStyle(color: Colors.grey)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                              width:
                                  12), // Space between TextFormField and DropdownButton
                          Expanded(
                            flex:
                                1, // Adjust the flex ratio according to your needs
                            child: InkWell(
                                onTap: () {
                                  Get.toNamed(RoutesClass.gotoFilterScreen());
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.brown,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: const Icon(
                                    Icons.tune,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  //height: MediaQuery.of(context).size.height * 0.72,
                  child: SingleChildScrollView(
                    // Change to SingleChildScrollView
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                      child: Column(
                        children: [
                          BannerCarousel(),
                          ShopCarousel(),
                          FlashSaleScreen(),
                          SizedBox(height: 20),
                          ProductSaleScreen(),
                          SizedBox(height: 20), // Add some space at the bottom
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          progressBarTransparent(
              controller.rxRequestStatus.value == Status.LOADING,
              MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.height)
        ]));
  }
}
