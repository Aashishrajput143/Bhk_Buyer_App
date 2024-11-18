import 'package:bhk_buyer_app/controller/shopcontroller.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:bhk_buyer_app/screens/homepage_management/tabbarsection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    Shopcontroller controller = Get.put(Shopcontroller());
    return Obx(
      () => Scaffold(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
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
                                      hintStyle: TextStyle(color: Colors.grey)),
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
                            padding: EdgeInsets.all(12),
                            child: const Icon(
                              Icons.tune,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  TabBarSection(),
                ],
              ),
            ),
            Expanded(
              //height: MediaQuery.of(context).size.height * 0.72,
              child: SingleChildScrollView(
                // Change to SingleChildScrollView
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                  child: SingleChildScrollView(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 items per row
                        crossAxisSpacing: 6.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: controller.productItems.length,
                      itemBuilder: (context, index) {
                        var product = controller.productItems[index];
                        return Stack(
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
                                                  product["imagePath"] ?? "",
                                                ),
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
                        );
                      },
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
