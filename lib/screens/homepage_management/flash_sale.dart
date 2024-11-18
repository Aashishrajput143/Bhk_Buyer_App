import 'package:bhk_buyer_app/screens/homepage_management/end_deal.dart';
import 'package:bhk_buyer_app/screens/homepage_management/tabbarsection.dart';
import 'package:flutter/material.dart';

class FlashSaleScreen extends StatelessWidget {
  const FlashSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime endTime = DateTime.now().add(Duration(hours: 10));
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Flash Sale',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DealTimer(endTime: endTime), //end_deal.dart
              ],
            ),
          ),
          TabBarSection(),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String imagePath, String finalprice, String price) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigate to category page
          },
          child: Container(
            width: 80,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey[300]!),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  //color: Colors.black54,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Rs. $finalprice',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        Text(
          'Rs. $price',
          style: const TextStyle(
            color: Color.fromARGB(126, 65, 64, 64),
            fontSize: 12,
            decoration: TextDecoration.lineThrough,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
