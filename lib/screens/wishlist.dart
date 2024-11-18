import 'package:bhk_buyer_app/controller/wishlistcontroller.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    Wishlistcontroller controller = Get.put(Wishlistcontroller());
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
              "Wishlist".toUpperCase(),
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
        child: Scaffold(
          backgroundColor: Colors.white70,
          body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SizedBox(
              height: 10,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: controller.wishlistItems.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(RoutesClass.gotoProductDetailsScreen());
                    },
                    child: Card(
                      color: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  controller.wishlistItems[index]['image'],
                                  height: 130,
                                  width: 140,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  controller.wishlistItems[index]['name'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '₹ ${controller.wishlistItems[index]['price']}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '₹${controller.wishlistItems[index]['oldPrice']}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      controller.wishlistItems[index]
                                          ['discount'],
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${controller.wishlistItems[index]['rating']}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '(${controller.wishlistItems[index]['reviews']})',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 18,
                            top: 18,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
