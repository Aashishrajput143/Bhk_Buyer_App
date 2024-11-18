import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:bhk_buyer_app/screens/homepage_management/dashboard.dart';
import 'package:bhk_buyer_app/screens/cart_screen.dart';
import 'package:bhk_buyer_app/screens/orders_management/orders_screen.dart';
import 'package:bhk_buyer_app/screens/profile_management/main_profile.dart';
import 'package:bhk_buyer_app/screens/shop.dart';
import 'package:bhk_buyer_app/widgets/appBardrawer.dart';
import 'package:bhk_buyer_app/widgets/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDash extends StatefulWidget {
  final int index;

  const CommonDash({super.key, required this.index});

  @override
  State<CommonDash> createState() => _CommonDashState();
}

class _CommonDashState extends State<CommonDash> {
  late int selectedScreenIndex; // Local variable in the State class

  @override
  void initState() {
    super.initState();
    // Assign the widget's variable to the local variable
    selectedScreenIndex = widget.index;
  }

  final List _screens = [
    {"screen": DashBoard(), "title": "HOME"},
    {"screen": Shop(), "title": "SHOP"},
    {"screen": CartPage(), "title": "My CART"},
    {"screen": OrdersList(), "title": "ORDERS HISTORY"},
    {"screen": MainProfile(), "title": "SETTINGS & MORE"}
  ];
  void _selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Background color for the rest of the screen
      appBar: (_screens[selectedScreenIndex]["title"] == "HOME")
          ? AppBar(
              backgroundColor: Colors.white, // AppBar background color
              elevation: 0, // Remove default elevation
              iconTheme: const IconThemeData(color: Color(0xFF5D2E17)),
              actions: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  radius: 22,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * .085),
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
            )
          : (_screens[selectedScreenIndex]["title"] == "SHOP")
              ? AppBar(
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  iconTheme: const IconThemeData(color: Color(0xFF5D2E17)),
                  title: Text(
                    _screens[selectedScreenIndex]["title"].toUpperCase(),
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
                )
              : (_screens[selectedScreenIndex]["title"] == "My CART")
                  ? AppBar(
                      backgroundColor: Colors.white,
                      centerTitle: true,
                      iconTheme: const IconThemeData(color: Color(0xFF5D2E17)),
                      title: Text(
                        _screens[selectedScreenIndex]["title"].toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xFF5D2E17)),
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
                        const SizedBox(width: 5),
                      ],
                    )
                  : PreferredSize(
                      preferredSize: Size.fromHeight(56.0), // AppBar height
                      child: Material(
                        elevation: 4.0, // Adjust elevation for shadow
                        shadowColor:
                            Colors.grey.withOpacity(0.5), // Shadow color
                        child: AppBar(
                          backgroundColor: Colors.white,
                          centerTitle: true,
                          iconTheme:
                              const IconThemeData(color: Color(0xFF5D2E17)),
                          title: Text(
                            _screens[selectedScreenIndex]["title"]
                                .toUpperCase(),
                            style: const TextStyle(
                                fontSize: 16, color: Color(0xFF5D2E17)),
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
                                Get.toNamed(
                                    RoutesClass.gotoNotificationScreen());
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
      drawer: const Appbardrawer(),
      body: _screens[selectedScreenIndex]["screen"],
      bottomNavigationBar: BottomMenu(
        selectedIndex: selectedScreenIndex,
        onClicked: _selectScreen,
      ),
    );
  }
}
