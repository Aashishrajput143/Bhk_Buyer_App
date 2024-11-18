import 'package:bhk_buyer_app/controller/dashboardcontroller.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopCarousel extends StatelessWidget {
  const ShopCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Collections',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black)),
            TextButton(
              onPressed: () {
                Get.toNamed(RoutesClass.gotoCategoriesScreen());
              },
              child: const Text(
                'See All',
                style: TextStyle(
                    color: Color.fromARGB(149, 93, 46, 23),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.shopItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        radius: 35,
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.all(
                                10.0), // Padding inside the CircleAvatar
                            child: Image.asset(
                              controller.shopItems[index]["imagePath"] ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        controller.shopItems[index]['title'] ?? "",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 11),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
