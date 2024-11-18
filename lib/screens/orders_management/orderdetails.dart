import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
              "Order Details".toUpperCase(),
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
        color: const Color.fromARGB(255, 243, 243, 243),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              color: Colors.brown,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.local_shipping, size: 40, color: Colors.white),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3),
                      Text(
                        'PKG6787949392',
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(188, 255, 255, 255),
                        ),
                      ),
                      Text(
                        'Package Delivered',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(212, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                    'Picked at 14 June 2020 at 4:45',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    '469 Woodridge Town, Winter Street NY',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Delivered at 14 June 2020 at 4:53',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    '345 Red Enclave, The Pentagon Circle NY',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Divider(height: 30),
                  _buildChargesRow('Delivery Charges', '₹ 5.00'),
                  _buildChargesRow('Express Delivery', '₹ 3.00'),
                  _buildChargesRow('Tax and Service Charges', '₹ 0.45'),
                  Divider(),
                  _buildChargesRow(
                    'Package Total',
                    '₹ 8.45',
                    isTotal: true,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Package Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildPackageDetailRow('Package Number', 'PKG6787949392'),
                  _buildPackageDetailRow(
                      'Package Items', 'Books and Stationary'),
                  _buildPackageDetailRow('Delivery Type', 'Express Delivery'),
                  _buildPackageDetailRow(
                    'Delivery Instructions',
                    "Don't ring the doorbell, do the knock knock.",
                  ),
                  _buildPackageDetailRow('Date', '14 June 2020 at 3:45 PM'),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.email, color: Colors.white),
                    label: Text('Email Invoice',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.help_outline, color: Colors.white),
                    label: Text('Need help?',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChargesRow(String title, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
