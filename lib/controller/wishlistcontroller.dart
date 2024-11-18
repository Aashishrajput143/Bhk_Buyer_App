import 'package:bhk_buyer_app/resources/images.dart';
import 'package:get/get.dart';

class Wishlistcontroller extends GetxController {
  var wishlistItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    wishlistItems.addAll([
      {
        'name': 'Leather duffle bag',
        'price': 23.00,
        'oldPrice': 25.00,
        'discount': '12% OFF',
        'rating': 4.31,
        'reviews': 7,
        'image': AppImages.product1,
      },
      {
        'name': 'Mac waist bag',
        'price': 23.00,
        'oldPrice': 25.00,
        'discount': '12% OFF',
        'rating': 4.31,
        'reviews': 7,
        'image': AppImages.product2,
      },
      {
        'name': 'Karia briefcase',
        'price': 23.00,
        'oldPrice': 25.00,
        'discount': '12% OFF',
        'rating': 4.31,
        'reviews': 7,
        'image': AppImages.product3,
      },
      {
        'name': 'Wildcraft backpack',
        'price': 23.00,
        'oldPrice': 25.00,
        'discount': '12% OFF',
        'rating': 4.31,
        'reviews': 7,
        'image': AppImages.product4,
      },
      {
        'name': 'Leather duffle bag',
        'price': 23.00,
        'oldPrice': 25.00,
        'discount': '12% OFF',
        'rating': 4.31,
        'reviews': 7,
        'image': AppImages.product5,
      },
      {
        'name': 'Mac waist bag',
        'price': 23.00,
        'oldPrice': 25.00,
        'discount': '12% OFF',
        'rating': 4.31,
        'reviews': 7,
        'image': AppImages.product6,
      },
      {
        'name': 'Karia briefcase',
        'price': 23.00,
        'oldPrice': 25.00,
        'discount': '12% OFF',
        'rating': 4.31,
        'reviews': 7,
        'image': AppImages.product7,
      },
      {
        'name': 'Wildcraft backpack',
        'price': 23.00,
        'oldPrice': 25.00,
        'discount': '12% OFF',
        'rating': 4.31,
        'reviews': 7,
        'image': AppImages.product8,
      },
      {
        'name': 'Wildcraft backpack',
        'price': 23.00,
        'oldPrice': 25.00,
        'discount': '12% OFF',
        'rating': 4.31,
        'reviews': 7,
        'image': AppImages.product9,
      },
    ]);
  }
}
