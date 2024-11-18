import 'package:bhk_buyer_app/controller/productdetailscontroller.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductPreviewController controller = Get.put(ProductPreviewController());
    return Obx(
      () => Scaffold(
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
                  "Product Details".toUpperCase(),
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
          body: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.79,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Image
                          Stack(
                            children: [
                              // Background Image
                              Container(
                                height: 500,
                                color: Colors.blueGrey.shade100,
                                child: Column(
                                  children: [
                                    CarouselSlider(
                                      items: controller.productItems.isNotEmpty
                                          ? controller
                                              .productItems.last["imagePath"]
                                              .map<Widget>((item) => Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    height:
                                                        430.0, // Adjust height as needed
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            item), // Use NetworkImage to fetch the image
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ))
                                              .toList()
                                          : [],
                                      carouselController:
                                          controller.slidercontroller,
                                      options: CarouselOptions(
                                        height: 430,
                                        enlargeCenterPage: true,
                                        viewportFraction: 1.0,
                                        aspectRatio: 2.0,
                                        onPageChanged: (index, reason) {
                                          controller.currentIndex.value =
                                              index; // Update current index
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Positioned elements on top of the image
                              Positioned(
                                bottom:
                                    15, // Positioning the content at the bottom of the image
                                left: 16,
                                right: 16,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // View Similar Button
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.view_carousel_outlined,
                                          color: Colors.black),
                                      label: Text(
                                        'View Similar',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                      ),
                                    ),
                                    // Rating Container
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.green, size: 16),
                                          SizedBox(width: 4),
                                          Text(
                                            '3.7',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            ' | 7',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.productItems.isNotEmpty
                                ? controller.productItems.last["imagePath"]
                                    .asMap()
                                    .entries
                                    .map<Widget>((entry) {
                                    return GestureDetector(
                                      onTap: () => controller.slidercontroller
                                          .animateToPage(entry.key),
                                      child: Container(
                                        width: 20.0,
                                        height: 8.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              (Theme.of(context).brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black)
                                                  .withOpacity(controller
                                                              .currentIndex
                                                              .value ==
                                                          entry.key
                                                      ? 0.9
                                                      : 0.4),
                                        ),
                                      ),
                                    );
                                  }).toList()
                                : [],
                          ),
                          // Product Title and Brand
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Trendyol Beige Solid Sheath Mini Dress',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(RoutesClass.gotoBrandScreen());
                                  },
                                  child: Text('Explore Brand',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 129, 69, 39),
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                          // Price Details
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  '₹ 879',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '₹2,199',
                                  style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.red[400]!,
                                        Colors.orange[200]!,
                                      ], // Gradient colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  child: Text(
                                    '60% OFF',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color:
                                          Colors.grey.shade300, // Border color
                                      width: 2, // Border width
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'OFFER ENDS IN ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '00h:52m',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Color selection
                                Text(
                                  "COLOUR: ${controller.selectedcolors[controller.selectedColorIndex.value]}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Wrap(
                                  spacing: 7,
                                  children: List.generate(
                                      controller.colors.length, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        controller.selectedColorIndex.value =
                                            index;
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                controller.selectedColorIndex ==
                                                        index
                                                    ? Colors.black
                                                    : Colors.transparent,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 25,
                                            height: 25,
                                            color: controller.colors[index],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),

                                SizedBox(height: 16),

                                Row(
                                  children: [
                                    Chip(
                                      label: Text('Hips 39"'),
                                      backgroundColor: Colors.grey[200],
                                    ),
                                    SizedBox(width: 8),
                                    Chip(
                                      label: Text('Bust 36"'),
                                      backgroundColor: Colors.grey[200],
                                    ),
                                    SizedBox(width: 8),
                                    Chip(
                                      label: Text('Brand Size M'),
                                      backgroundColor: Colors.grey[200],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                // Size selection
                                Text(
                                  "SIZE: ${controller.sizes[controller.selectedSizeIndex.value]}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Wrap(
                                  spacing: 10,
                                  children: List.generate(
                                      controller.sizes.length, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        controller.selectedSizeIndex.value =
                                            index;
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                controller.selectedSizeIndex ==
                                                        index
                                                    ? Colors.black
                                                    : Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          controller.sizes[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                controller.selectedSizeIndex ==
                                                        index
                                                    ? Colors.black
                                                    : Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hurry, only few items left',
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(height: 16),

                                // Delivery Details
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: ListTile(
                                    title: Text('Delivery Details'),
                                    trailing: Text(
                                      'Check delivery date',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),

                                // Bank Offers
                                ListTile(
                                  leading: Icon(Icons.local_offer_outlined),
                                  title: Text(
                                      'Get 10% Instant Discount of up to Rs.1000 on a minimum transaction value of Rs 2999 using SBI Credit Card.'),
                                  subtitle: Text('T&C Apply',
                                      style: TextStyle(color: Colors.blue)),
                                ),
                                SizedBox(height: 16),
                                Divider(
                                  color:
                                      const Color.fromARGB(255, 233, 233, 233),
                                  thickness: 7,
                                ),
                                controller.buildSection("Fabric",
                                    "Sleeve Styling", "Cotton", "No Sleeves"),
                                Divider(),
                                controller.buildSection(
                                    "Neck",
                                    "Surface Styling",
                                    "Round Neck",
                                    "Gathered or Pleated"),
                                Divider(),

                                SizedBox(height: 16),
                                // Product Details
                                ListTile(
                                  title: Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      'Product Details',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('• Package contains: 1 top'),
                                      Text('• Machine wash cold'),
                                      Text('• 98% cotton, 2% elastane'),
                                      Text('• Slim Fit'),
                                      Text('• Product Code: 469300081_black'),
                                      Text('• Our model wears a Size S'),
                                    ],
                                  ),
                                  trailing: Text('+ More',
                                      style: TextStyle(color: Colors.blue)),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: const Color.fromARGB(255, 233, 233, 233),
                            thickness: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Rating & Reviews
                                Text(
                                  'Rating & Reviews',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text('3.9',
                                            style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold)),
                                        Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.green),
                                            Text('82 Verified Buyers'),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        children: List.generate(5, (index) {
                                          int starCount = 5 - index;
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            child: Row(
                                              children: [
                                                Text('$starCount★'),
                                                SizedBox(width: 8),
                                                Expanded(
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: [
                                                      0.8,
                                                      0.3,
                                                      0.25,
                                                      0.2,
                                                      0.2
                                                    ][index],
                                                    color: Colors.green,
                                                    backgroundColor:
                                                        Colors.grey[300],
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Text('${[
                                                  42,
                                                  14,
                                                  12,
                                                  12,
                                                  12
                                                ][index]}'),
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(height: 32, thickness: 1),
                                // What Customers Said
                                Text(
                                  'What Customers Said',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 16),
                                ListView.builder(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: controller.reviewItems.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              controller.reviewItems[index]
                                                  ["title"],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 8),
                                          Column(
                                            children: List.generate(
                                                controller
                                                    .reviewItems[index]
                                                        ["labels"]
                                                    .length, (ind) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child:
                                                          LinearProgressIndicator(
                                                        value: controller.reviewItems[
                                                                        index]
                                                                    ["values"]
                                                                [ind] is int
                                                            ? controller
                                                                .reviewItems[
                                                                    index]
                                                                    ["values"]
                                                                    [ind]
                                                                .toDouble()
                                                            : controller
                                                                    .reviewItems[index]
                                                                ["values"][ind],
                                                        color: Colors.green,
                                                        backgroundColor:
                                                            Colors.grey[300],
                                                      ),
                                                    ),
                                                    SizedBox(width: 16),
                                                    Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                            '${controller.reviewItems[index]["labels"][ind]} (${(controller.reviewItems[index]["values"][ind] * 100).toInt()}%)')),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                          SizedBox(height: 16),
                                        ],
                                      );
                                    }),
                              ],
                            ),
                          ),
                          Divider(
                            color: const Color.fromARGB(255, 233, 233, 233),
                            thickness: 7,
                          ),
                          Column(
                            children: List.generate(
                              controller.reviews.length,
                              (ind) {
                                final review = controller.reviews[ind];

                                return Container(
                                  // margin: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4.0),
                                              decoration: BoxDecoration(
                                                color: Colors.teal,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Text(
                                                '${review["rating"]}★',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(width: 8.0),
                                            Text(
                                              review["time"]!,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          review["comment"]!,
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        SizedBox(height: 8.0),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: Text(
                                              'Size bought: ${review["size"]}'),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          review["name"]!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text("Helpful?",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            IconButton(
                                              icon: Icon(Icons.thumb_up,
                                                  color: Colors.grey),
                                              onPressed: () {},
                                            ),
                                            Text("0"),
                                            IconButton(
                                              icon: Icon(Icons.thumb_down,
                                                  color: Colors.grey),
                                              onPressed: () {},
                                            ),
                                            Text("0"),
                                          ],
                                        ),
                                        Divider(height: 32, thickness: 1),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Style With",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  height: 300,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        controller.styleWithItems.length,
                                        (index) {
                                          return Container(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 8, 8, 8),
                                            width: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(8),
                                                  height: 180,
                                                  color: Colors.grey[300],
                                                  child: Center(
                                                    child: Image.asset(
                                                      controller.styleWithItems[
                                                          index]["image"],
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                if (controller.styleWithItems[
                                                        index]["subtitle"] !=
                                                    null)
                                                  Text(
                                                    controller.styleWithItems[
                                                        index]["subtitle"],
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                Text(
                                                  controller
                                                          .styleWithItems[index]
                                                      ["title"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  controller
                                                          .styleWithItems[index]
                                                      ["price"],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Others also bought",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  height: 300,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        controller.alsoBoughtItems.length,
                                        (index) {
                                          return Container(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 8, 8, 8),
                                            width: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(8),
                                                  height: 180,
                                                  color: Colors.grey[300],
                                                  child: Center(
                                                    child: Image.asset(
                                                      controller
                                                              .alsoBoughtItems[
                                                          index]["image"],
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  controller.alsoBoughtItems[
                                                      index]["title"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  controller.alsoBoughtItems[
                                                      index]["price"],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Wishlist and Add to Bag Buttons
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey[300]!)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.white, // Button background color
                              side: BorderSide(
                                  color: Colors.grey), // Border color and width
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    5), // Circular border radius
                              ),
                              minimumSize: Size(
                                  150, 50), // Set the width and height here
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite_border,
                                  size: 16,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'WISHLIST',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.pink, // Button background color
                              side: BorderSide(
                                  color: Colors.pink), // Border color and width
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    5), // Circular border radius
                              ),
                              minimumSize: Size(
                                  150, 50), // Set the width and height here
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_bag,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'ADD TO BAG',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     CarouselSlider(
      //       items: controller
      //               .getProductDetailsModel
      //               .value
      //               .data
      //               ?.variants?[(controller.getProductDetailsModel.value.data
      //                           ?.variants?.length ??
      //                       0) -
      //                   1]
      //               .media
      //               ?.images
      //               ?.map((item) => SizedBox(
      //                     width: double.infinity,
      //                     height: 430.0, // Adjust height as per your design
      //                     child: Padding(
      //                       padding:
      //                           const EdgeInsets.symmetric(horizontal: 8.0),
      //                       child: ClipRRect(
      //                         child: Container(
      //                           decoration: const BoxDecoration(),
      //                           height:
      //                               430, // Adjust height as per your design
      //                           child: Row(
      //                             children: [
      //                               // Image on the Left Side
      //                               Container(
      //                                 width:
      //                                     MediaQuery.of(context).size.width -
      //                                         3, // Adjust width as needed
      //                                 height: double
      //                                     .infinity, // Fill the entire height of the container
      //                                 decoration: BoxDecoration(
      //                                   image: DecorationImage(
      //                                     image: NetworkImage(
      //                                         item), // Image asset
      //                                     fit: BoxFit.cover,
      //                                   ),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ))
      //               .toList() ??
      //           [],
      //       carouselController: controller.slidercontroller,
      //       options: CarouselOptions(
      //         height: 430,
      //         enlargeCenterPage: true,
      //         viewportFraction: 1.035,
      //         aspectRatio: 2.0,
      //         onPageChanged: (index, reason) {
      //           controller.currentIndex.value = index;
      //         },
      //       ),
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: controller
      //               .getProductDetailsModel
      //               .value
      //               .data
      //               ?.variants?[(controller.getProductDetailsModel.value.data
      //                           ?.variants?.length ??
      //                       0) -
      //                   1]
      //               .media
      //               ?.images
      //               ?.asMap()
      //               .entries
      //               .map((entry) {
      //             return GestureDetector(
      //               onTap: () =>
      //                   controller.slidercontroller.animateToPage(entry.key),
      //               child: Container(
      //                 width: 20.0,
      //                 height: 8.0,
      //                 margin: const EdgeInsets.symmetric(
      //                     vertical: 10.0, horizontal: 4.0),
      //                 decoration: BoxDecoration(
      //                   shape: BoxShape.circle,
      //                   color: (Theme.of(context).brightness ==
      //                               Brightness.dark
      //                           ? Colors.white
      //                           : Colors.black)
      //                       .withOpacity(controller.currentIndex == entry.key
      //                           ? 0.9
      //                           : 0.4),
      //                 ),
      //               ),
      //             );
      //           }).toList() ??
      //           [],
      //     ),
      //     Padding(
      //       padding: EdgeInsets.all(5),
      //       child: Column(
      //         children: [
      //           // Product Name, Price and Quantity
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   controller.getProductDetailsModel.value.data
      //                           ?.productName ??
      //                       "",
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold, fontSize: 22),
      //                 ),
      //                 SizedBox(height: 8),
      //                 Row(
      //                   children: [
      //                     Text(
      //                         '₹ ${controller.getProductDetailsModel.value.data?.variants?[(controller.getProductDetailsModel.value.data?.variants?.length ?? 0) - 1].sellingPrice ?? ""}',
      //                         style: TextStyle(
      //                             fontSize: 18, fontWeight: FontWeight.bold)),
      //                     SizedBox(width: 8),
      //                     Text(
      //                         '₹ ${controller.getProductDetailsModel.value.data?.variants?[(controller.getProductDetailsModel.value.data?.variants?.length ?? 0) - 1].mrp ?? ""}',
      //                         style: TextStyle(
      //                             decoration: TextDecoration.lineThrough)),
      //                     SizedBox(width: 8),
      //                     Text(
      //                         '${controller.getProductDetailsModel.value.data?.variants?[(controller.getProductDetailsModel.value.data?.variants?.length ?? 0) - 1].discount ?? ""}% OFF',
      //                         style: TextStyle(color: Colors.green)),
      //                   ],
      //                 ),
      //                 SizedBox(height: 8),
      //                 Row(
      //                   children: [
      //                     Text('Quantity : ',
      //                         style: TextStyle(fontWeight: FontWeight.bold)),
      //                     SizedBox(width: 10),
      //                     Text(
      //                       '₹ ${controller.getProductDetailsModel.value.data?.variants?[(controller.getProductDetailsModel.value.data?.variants?.length ?? 0) - 1].quantity ?? ""} Units',
      //                       style: TextStyle(
      //                           fontSize: 16, fontWeight: FontWeight.bold),
      //                     )
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Divider(),
      //           // Product Description
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text('Product Description',
      //                     style: TextStyle(fontWeight: FontWeight.bold)),
      //                 SizedBox(height: 8),
      //                 Row(
      //                   children: [
      //                     Text(
      //                       controller.getProductDetailsModel.value.data
      //                               ?.description ??
      //                           "Not Available",
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Divider(),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   'Product Details',
      //                   style: TextStyle(
      //                       fontSize: 16, fontWeight: FontWeight.bold),
      //                 ),
      //                 SizedBox(height: 10),
      //                 controller.productDetailRow(
      //                     'Material',
      //                     controller
      //                             .getProductDetailsModel
      //                             .value
      //                             .data
      //                             ?.variants?[(controller
      //                                         .getProductDetailsModel
      //                                         .value
      //                                         .data
      //                                         ?.variants
      //                                         ?.length ??
      //                                     0) -
      //                                 1]
      //                             .material ??
      //                         "Not Available"),
      //                 controller.productDetailRow(
      //                     'Colour',
      //                     controller
      //                             .getProductDetailsModel
      //                             .value
      //                             .data
      //                             ?.variants?[(controller
      //                                         .getProductDetailsModel
      //                                         .value
      //                                         .data
      //                                         ?.variants
      //                                         ?.length ??
      //                                     0) -
      //                                 1]
      //                             .color ??
      //                         "Not Available"),
      //                 controller.productDetailRow(
      //                     'Size',
      //                     controller
      //                             .getProductDetailsModel
      //                             .value
      //                             .data
      //                             ?.variants?[(controller
      //                                         .getProductDetailsModel
      //                                         .value
      //                                         .data
      //                                         ?.variants
      //                                         ?.length ??
      //                                     0) -
      //                                 1]
      //                             .size ??
      //                         "Not Available"),

      //                 controller.productDetailRow(
      //                     'Dimensions',
      //                     controller
      //                             .getProductDetailsModel
      //                             .value
      //                             .data
      //                             ?.variants?[(controller
      //                                         .getProductDetailsModel
      //                                         .value
      //                                         .data
      //                                         ?.variants
      //                                         ?.length ??
      //                                     0) -
      //                                 1]
      //                             .productDimensions ??
      //                         "Not Available"),
      //                 controller.productDetailRow(
      //                     'Product Weight',
      //                     controller
      //                             .getProductDetailsModel
      //                             .value
      //                             .data
      //                             ?.variants?[(controller
      //                                         .getProductDetailsModel
      //                                         .value
      //                                         .data
      //                                         ?.variants
      //                                         ?.length ??
      //                                     0) -
      //                                 1]
      //                             .weight ??
      //                         "Not Available"),
      //SizedBox(height: 10),
      // Text(
      //   'Features',
      //   style: TextStyle(
      //       fontSize: 16, fontWeight: FontWeight.bold),
      // ),
      // SizedBox(height: 10),
      // Text(
      //     'Environmental Brass Alloy With Top Quality Genuine Plating, World-Class Craftsmanship, TSB Collection Makes People Remember Not Only The Jewellery Itself, But Also The Woman.'),
      // SizedBox(height: 10),
      // Text(
      //   'Care Instruction',
      //   style: TextStyle(
      //       fontSize: 16, fontWeight: FontWeight.bold),
      // ),
      // SizedBox(height: 10),
      // Text(
      //     'Keep Away From Water Perfume And Other Chemicals And Clean It With Dry And Soft Cloth.'),

      // Divider(),
      // Text(
      //   'Explore More Variants',
      //   style: TextStyle(
      //     fontSize: 16,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      // const SizedBox(height: 15),
      // GridView.builder(
      //   shrinkWrap: true,
      //   physics: const NeverScrollableScrollPhysics(),
      //   gridDelegate:
      //       const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 3 / 4,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 5,
      //   ),
      //   itemCount: controller.variantsItem.length,
      //   itemBuilder: (context, index) {
      //     return Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         InkWell(
      //           onTap: () {
      //             // Navigate to category page
      //           },
      //           child: Container(
      //             width: 170,
      //             height: 150,
      //             decoration: BoxDecoration(
      //               image: DecorationImage(
      //                 image: AssetImage(
      //                     controller.variantsItem[index]
      //                         ['imagePath']),
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //             child: Align(
      //               alignment: Alignment.bottomCenter,
      //               child: Container(
      //                 padding: const EdgeInsets.all(8),
      //                 decoration: const BoxDecoration(
      //                     //color: Colors.black54,
      //                     ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 10),
      //         Text(
      //           controller.variantsItem[index]['title'],
      //           style: const TextStyle(
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 12,
      //           ),
      //           textAlign: TextAlign.start,
      //         ),
      //         const SizedBox(height: 6),
      //         Row(
      //           mainAxisSize: MainAxisSize.min,
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment:
      //               CrossAxisAlignment.center,
      //           children: [
      //             Text(
      //               "${controller.variantsItem[index]['finalprice']}",
      //               style: const TextStyle(
      //                 color: Colors.black,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 15,
      //               ),
      //               textAlign: TextAlign.start,
      //             ),
      //             const SizedBox(width: 6),
      //             Text(
      //               "${controller.variantsItem[index]['price']}",
      //               style: const TextStyle(
      //                 color: Color.fromARGB(
      //                     198, 143, 142, 142),
      //                 fontSize: 10,
      //                 decoration:
      //                     TextDecoration.lineThrough,
      //               ),
      //               textAlign: TextAlign.start,
      //             ),
      //             const SizedBox(width: 6),
      //             Text(
      //               '(${controller.variantsItem[index]['discount']})',
      //               style: const TextStyle(
      //                 color: Color.fromARGB(
      //                     198, 143, 142, 142),
      //                 fontSize: 10,
      //               ),
      //               textAlign: TextAlign.start,
      //             ),
      //           ],
      //         ),
      //       ],
      //     );
      //   },
      // ),
      // Add your custom 'People Also Viewed' section here
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
   