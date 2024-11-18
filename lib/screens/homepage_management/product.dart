import 'package:bhk_buyer_app/controller/dashboardcontroller.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSaleScreen extends StatelessWidget {
  const ProductSaleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());

    return Obx(
      () => SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 0.7,
          ),
          itemCount: controller.productItems.length,
          itemBuilder: (context, index) {
            // Ensure each product item has an `isWishlist` property as RxBool
            var product = controller.productItems[index];

            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesClass.gotoProductDetailsScreen());
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
                            color: Color.fromARGB(198, 143, 142, 142),
                            fontSize: 10,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '(${product["discount"]})',
                          style: const TextStyle(
                            color: Color.fromARGB(198, 143, 142, 142),
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
                      color: product["Wishlist"] ? Colors.red : Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
