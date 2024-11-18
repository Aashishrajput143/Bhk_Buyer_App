import 'package:bhk_buyer_app/resources/images.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/address_management/my_address.dart';

class Appbardrawer extends StatelessWidget {
  const Appbardrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.55,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Christian",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            accountEmail: Text(
              "bhkbuyer@gmail.com",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            currentAccountPicture: ClipOval(
              child: Image(
                image: AssetImage(AppImages.profile),
                fit: BoxFit.cover,
              ),
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 142, 79, 47),
                Color.fromARGB(255, 183, 160, 148),
                Color.fromARGB(255, 255, 255, 255)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            child: Text(
              'NAVIGATION',
              style: TextStyle(
                  color: const Color.fromARGB(255, 139, 136, 136),
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            minTileHeight: 7,
            leading: Icon(Icons.home, color: Colors.black),
            title: Text('Home', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
              Get.offNamed(RoutesClass.gotoDashboardScreen());
            },
          ),
          ListTile(
            minTileHeight: 7,
            leading: Icon(Icons.store, color: Colors.black),
            title: Text('Shop', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
              Get.offNamed(RoutesClass.gotoShopScreen());
            },
          ),
          ListTile(
            minTileHeight: 7,
            leading: Icon(Icons.collections_bookmark, color: Colors.black),
            title: Text('Collections', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
              Get.toNamed(RoutesClass.gotoCategoriesScreen());
            },
          ),
          ListTile(
            minTileHeight: 7,
            leading: Icon(Icons.shopping_cart, color: Colors.black),
            title: Text('Cart', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
              Get.offNamed(RoutesClass.gotoCartScreen());
            },
          ),
          ListTile(
            minTileHeight: 7,
            leading: Icon(Icons.favorite, color: Colors.black),
            title: Text('Wishlist', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
              Get.toNamed(RoutesClass.gotoWishlistScreen());
            },
          ),
          ListTile(
            minTileHeight: 7,
            leading: Icon(Icons.branding_watermark_sharp, color: Colors.black),
            title:
                Text('Explore Brands', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
              Get.toNamed(RoutesClass.gotoBrandScreen());
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            child: Text(
              'MY ACCOUNT',
              style: TextStyle(
                  color: const Color.fromARGB(255, 139, 136, 136),
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            minTileHeight: 7,
            leading: Icon(Icons.account_circle, color: Colors.black),
            title: Text('Account Info', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
              Get.offNamed(RoutesClass.gotoProfileScreen());
            },
          ),
          ListTile(
            minTileHeight: 7,
            leading: Icon(Icons.list_outlined, color: Colors.black),
            title: Text('My Orders', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
              Get.offNamed(RoutesClass.gotoOrderScreen());
            },
          ),
          ListTile(
            minTileHeight: 7,
            leading: Icon(Icons.receipt, color: Colors.black),
            title: Text('My Addresses', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAddresses()),
              );
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            child: Text(
              'AUTHENTICATION',
              style: TextStyle(
                  color: const Color.fromARGB(255, 139, 136, 136),
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            minTileHeight: 7,
            leading: Icon(Icons.login, color: Colors.black),
            title: Text("Login", style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
              Get.offNamed(RoutesClass.gotoLoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
