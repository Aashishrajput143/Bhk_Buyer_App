import 'package:bhk_buyer_app/controller/orderhistorycontroller.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SizedBox(
                height: 10,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.orderItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Get.toNamed(RoutesClass.gotoOrderdetailsScreen());
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                              color: Colors.grey.shade400, // Border color
                              width: 1.5, // Border width
                            ),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300, // Shadow color
                                blurRadius: 6, // Blur radius for the shadow
                                offset:
                                    Offset(0, 4), // Offset for shadow position
                              ),
                            ], // Match the card's border radius
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("order Number".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade500)),
                                        SizedBox(height: 5),
                                        Text(
                                            controller.orderItems[index]
                                                ["orderNumber"],
                                            style: TextStyle(fontSize: 14)),
                                        SizedBox(height: 8),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(RoutesClass
                                            .gotoOrderdetailsScreen());
                                      },
                                      child: Icon(
                                        Icons.chevron_right,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      controller.orderItems[index]["status"] ==
                                              'Delivered'
                                          ? Icons.check_circle
                                          : controller.orderItems[index]
                                                      ["status"] ==
                                                  'Preparing To Pack'
                                              ? Icons.hourglass_empty
                                              : Icons.local_shipping,
                                      color: controller.orderItems[index]
                                                  ["status"] ==
                                              'Delivered'
                                          ? Colors.green
                                          : Colors.orange,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      controller.orderItems[index]["status"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 28),
                                  child: Text(
                                      'on ${controller.orderItems[index]["date"]}',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14)),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: AssetImage(controller
                                              .orderItems[index]["imagePath"]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              controller.orderItems[index]
                                                  ["productName"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16)),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Text(
                                                  "Size : ${controller.orderItems[index]["size"]}",
                                                  style: TextStyle(
                                                      color: Colors.grey)),
                                              SizedBox(width: 5),
                                              Text("||",
                                                  style: TextStyle(
                                                      color: Colors.grey)),
                                              SizedBox(width: 5),
                                              Text(
                                                  "Color : ${controller.orderItems[index]["color"]}",
                                                  style: TextStyle(
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Text(
                                                  '₹ ${controller.orderItems[index]["currentPrice"]}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16)),
                                              SizedBox(width: 8),
                                              Text(
                                                  '₹ ${controller.orderItems[index]["originalPrice"]}',
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                controller.orderItems[index]["returnAvailable"]
                                        .isNotEmpty
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Divider(),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 8),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width:
                                                        10, // Width of the rectangle
                                                    height:
                                                        10, // Height of the rectangle (same as width for a square)
                                                    decoration: BoxDecoration(
                                                      color: Colors
                                                          .green, // Green color
                                                      shape: BoxShape
                                                          .rectangle, // Rectangle shape
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    controller.orderItems[index]
                                                        ["returnAvailable"],
                                                  ),
                                                ],
                                              )),
                                          Divider(),
                                        ],
                                      )
                                    : SizedBox(),
                                controller.orderItems[index]["showActions"]
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Icon(Icons.local_mall_outlined),
                                                SizedBox(width: 3),
                                                Text('Exchange'),
                                              ],
                                            ),
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              backgroundColor: Colors.grey[200],
                                              foregroundColor: Colors.black,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Icon(Icons.keyboard_return),
                                                SizedBox(width: 3),
                                                Text('Return'),
                                              ],
                                            ),
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              backgroundColor: Colors.grey[200],
                                              foregroundColor: Colors.black,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Icon(Icons.repeat),
                                                SizedBox(width: 3),
                                                Text('Repeat'),
                                              ],
                                            ),
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              backgroundColor: Colors.grey[200],
                                              foregroundColor: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        ));
                  },
                ))),
      ),
    );
  }
}
