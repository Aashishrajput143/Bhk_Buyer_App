import 'package:bhk_buyer_app/resources/images.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewProfilePage extends StatelessWidget {
  const ViewProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // AppBar height
        child: Material(
          elevation: 4.0, // Adjust elevation for shadow
          shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Color(0xFF5D2E17)),
            title: Text(
              "View Profile".toUpperCase(),
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
      body: Scaffold(
        backgroundColor: Colors.white70,
        body: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                backgroundImage: AssetImage(
                  AppImages.profile,
                ),
                radius: 70.0,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  leading: Icon(Icons.person_outline, color: Colors.black),
                  title: Text(
                    "Name",
                    style: TextStyle(color: Colors.grey),
                  ),
                  subtitle: Text(
                    'Ronald richards',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  leading: Icon(Icons.email_outlined, color: Colors.black),
                  title: Text(
                    "Email",
                    style: TextStyle(color: Colors.grey),
                  ),
                  subtitle: Text(
                    'ronaldrichards@gmail.com',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  leading: Icon(Icons.phone_outlined, color: Colors.black),
                  title: Text(
                    "Phone Number",
                    style: TextStyle(color: Colors.grey),
                  ),
                  subtitle: Text(
                    "+91 9876543210",
                    style: TextStyle(fontSize: 16, color: Colors.black),
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
