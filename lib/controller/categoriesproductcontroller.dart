import 'package:bhk_buyer_app/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categoriesproductcontroller extends GetxController {
  var productItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Add your banner items here or fetch them from an API
    productItems.addAll([
      {
        "imagePath": AppImages.product3,
        "title": "Antique Old Brass Vessel",
        "finalPrice": "Rs.15000",
        "price": "Rs.25000",
        "rating": "4.5",
        "reviewCount": "108",
        "discount": "20%Off",
        "Wishlist": false
      },
      {
        "imagePath": AppImages.product4,
        "title": "Antique Old Brass Vessel",
        "finalPrice": "Rs.2500",
        "price": "Rs.5000",
        "rating": "3.0",
        "reviewCount": "75",
        "discount": "10%Off",
        "Wishlist": false
      },
      {
        "imagePath": AppImages.product5,
        "title": "Antique Old Brass Vessel",
        "finalPrice": "Rs.15000",
        "price": "Rs.25000",
        "rating": "4.5",
        "reviewCount": "108",
        "discount": "30%Off",
        "Wishlist": false
      },
      {
        "imagePath": AppImages.product6,
        "title": "Antique Old Brass Vessel",
        "finalPrice": "Rs.2500",
        "price": "Rs.5000",
        "rating": "3.5",
        "reviewCount": "75",
        "discount": "25%Off",
        "Wishlist": false
      },
      {
        "imagePath": AppImages.product7,
        "title": "Antique Old Brass Vessel",
        "finalPrice": "Rs.15000",
        "price": "Rs.25000",
        "rating": "4.5",
        "reviewCount": "108",
        "discount": "20%Off",
        "Wishlist": false
      },
      {
        "imagePath": AppImages.product8,
        "title": "Antique Old Brass Vessel",
        "finalPrice": "Rs.15000",
        "price": "Rs.25000",
        "rating": "4.5",
        "reviewCount": "108",
        "discount": "20%Off",
        "Wishlist": false
      },
      {
        "imagePath": AppImages.product9,
        "title": "Antique Old Brass Vessel",
        "finalPrice": "Rs.15000",
        "price": "Rs.25000",
        "rating": "4.5",
        "reviewCount": "108",
        "discount": "20%Off",
        "Wishlist": false
      },
      {
        "imagePath": AppImages.product2,
        "title": "Antique Old Brass Vessel",
        "finalPrice": "Rs.15000",
        "price": "Rs.25000",
        "rating": "4.5",
        "reviewCount": "108",
        "discount": "20%Off",
        "Wishlist": false
      },
    ]);
  }

  void toggleWishlist(int index) {
    productItems[index]["Wishlist"] = !productItems[index]["Wishlist"];
    productItems.refresh(); // Toggle the value
  }

  Widget starprinting(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(rating.round(), (index) {
        return Icon(
          index < rating.floor()
              ? Icons.star
              : Icons.star_half, // Filled or empty star based on index
          color: Colors.black, // Black star color
          size: 14.0, // Size of stars
        );
      }),
    );
  }
}
