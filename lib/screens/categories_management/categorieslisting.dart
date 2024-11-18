import 'package:bhk_buyer_app/controller/categoriescontroller.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesListing extends StatelessWidget {
  CategoriesListing({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesController controller = Get.put(CategoriesController());
    return Scaffold(
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
              "Categories".toUpperCase(),
              style: const TextStyle(fontSize: 16, color: Color(0xFF5D2E17)),
            ),
            actions: [
              IconButton(
                icon:
                    const Icon(Icons.favorite_border, color: Color(0xFF5D2E17)),
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.CategoriesItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(6),
              child: Card(
                color: const Color.fromARGB(244, 243, 242, 242),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.CategoriesItems[index]["category"],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            CircleAvatar(
                              backgroundColor: controller.CategoriesItems[index]
                                  ["color"],
                              child: Icon(
                                  controller.CategoriesItems[index]
                                      ["categoryicon"],
                                  color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(
                                    RoutesClass.gotoCategoriesdetailsScreen());
                              },
                              child: Text('View All',
                                  style: TextStyle(
                                      color: Color.fromARGB(149, 93, 46, 23),
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            controller.CategoriesItems[index]["title"].length,
                            (ind) {
                          return Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage(controller
                                            .CategoriesItems[index]["images"]
                                        [ind]), // Replace with your image path
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                controller.CategoriesItems[index]["title"][ind],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
