import 'package:bhk_buyer_app/controller/cartcontroller.dart';
import 'package:bhk_buyer_app/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// import 'orders_screen.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return Obx(
      () => Column(
        children: [
          // Free shipping banner
          Container(
            color: Colors.green[100],
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("You've Received Free Shipping!"),
                Spacer(),
                Icon(Icons.local_shipping, color: Colors.green),
              ],
            ),
          ),

          // Progress bar
          LinearProgressIndicator(
            value: 1.0, // Full progress bar
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          controller.cartItems.length == 0
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.59,
                  child: Stack(
                    children: [
                      // Centered text
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 25),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Your Cart is Empty',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Background image using Lottie animation
                      Positioned.fill(
                        child: Lottie.asset(
                          AppImages
                              .cartempty, // Update with your Lottie asset path
                        ),
                      ),
                    ],
                  ),
                )
              :
              // Cart items list
              Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                // Product image
                                Image.asset(
                                    controller.cartItems[index]["imagePath"] ??
                                        "",
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover),
                                SizedBox(width: 16),
                                // Product details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          controller.cartItems[index]
                                                  ["title"] ??
                                              "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          controller.cartItems[index]
                                                  ["category"] ??
                                              "",
                                          style: TextStyle(color: Colors.grey)),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text(
                                              '₹ ${controller.cartItems[index]["price"] ?? ""}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(width: 10),
                                          Text(
                                              controller.cartItems[index]
                                                      ["discount"] ??
                                                  "",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                // Quantity selector and delete button
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 60),
                                      child: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          controller.deletecartitem(index);
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4,
                                          vertical:
                                              4), // Reduced padding around the entire row
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors
                                                .grey), // Adds the rectangular border
                                        borderRadius: BorderRadius.circular(
                                            4), // Optional: Slight corner rounding
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize
                                            .min, // Ensures container wraps the content tightly
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.removecartitem(index);
                                            },
                                            child: Icon(Icons.remove,
                                                size:
                                                    22), // Smaller icon size for tighter layout
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    8), // Padding between icons and quantity text
                                            child: Text(
                                                '${controller.cartItems[index]["quantity"] ?? ""}',
                                                style: TextStyle(fontSize: 18)),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.addcartitem(index);
                                            },
                                            child: Icon(Icons.add,
                                                size:
                                                    22), // Smaller icon size for tighter layout
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                ),

          // Subtotal and checkout button
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal (${controller.cartItems.length} Items)'),
                    Obx(
                      () => Text('₹ ${controller.subtotal.toStringAsFixed(2)}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Continue to checkout
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Continue To Checkout',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Psst, get it now before it sells out.',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
