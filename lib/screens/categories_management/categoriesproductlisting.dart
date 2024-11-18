import 'package:bhk_buyer_app/controller/categoriesproductcontroller.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categoriesproducts extends StatelessWidget {
  Categoriesproducts({super.key});

  @override
  Widget build(BuildContext context) {
    Categoriesproductcontroller controller =
        Get.put(Categoriesproductcontroller());
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
              "Grills & Smokers".toUpperCase(),
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(
                    bottom: 20.0), // add padding to the bottom if needed
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 0.6,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var product = controller.productItems[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                        RoutesClass.gotoProductDetailsScreen());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    width: 175,
                                    height: 170,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    product["imagePath"] ?? ""),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  product["title"] ?? "",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    controller.starprinting(
                                      double.parse(product["rating"] ?? "0"),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '(${product["reviewCount"]})',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      product["finalPrice"] ?? "",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      product["price"] ?? "",
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(198, 143, 142, 142),
                                        fontSize: 10,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '(${product["discount"]})',
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(198, 143, 142, 142),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                              right: 18,
                              top: 10,
                              child: InkWell(
                                onTap: () {
                                  controller.toggleWishlist(index);
                                  print(product["Wishlist"]);
                                },
                                child: Icon(
                                  product["Wishlist"]
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: product["Wishlist"]
                                      ? Colors.red
                                      : Colors.black,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: controller.productItems.length,
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
