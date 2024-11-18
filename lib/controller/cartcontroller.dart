import 'package:bhk_buyer_app/resources/images.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    print(subtotal);
    // Add your banner items here or fetch them from an API
    cartItems.addAll([
      {
        "imagePath": AppImages.product3,
        "category": "Accessories",
        "title": "Antique Old Brass Vessel",
        'quantity': 1,
        "price": 15000,
        "discount": "20%Off"
      },
      {
        "imagePath": AppImages.product4,
        "category": "Clothes",
        "title": "Antique Old Brass Vessel",
        'quantity': 1,
        "price": 2500,
        "discount": "10%Off"
      },
      {
        "imagePath": AppImages.product5,
        "title": "Antique Old Brass Vessel",
        "category": "Lifestyle",
        'quantity': 1,
        "price": 15000,
        "discount": "30%Off"
      },
      {
        "imagePath": AppImages.product6,
        "title": "Antique Old Brass Vessel",
        "category": "Handicraft",
        'quantity': 1,
        "price": 2500,
        "discount": "25%Off"
      },
      {
        "imagePath": AppImages.product3,
        "category": "Accessories",
        "title": "Antique Old Brass Vessel",
        'quantity': 1,
        "price": 15000,
        "discount": "20%Off"
      },
      {
        "imagePath": AppImages.product4,
        "category": "Clothes",
        "title": "Antique Old Brass Vessel",
        'quantity': 1,
        "price": 2500,
        "discount": "10%Off"
      },
      {
        "imagePath": AppImages.product5,
        "title": "Antique Old Brass Vessel",
        "category": "Lifestyle",
        'quantity': 1,
        "price": 15000,
        "discount": "30%Off"
      },
      {
        "imagePath": AppImages.product6,
        "title": "Antique Old Brass Vessel",
        "category": "Handicraft",
        'quantity': 1,
        "price": 2500,
        "discount": "25%Off"
      },
    ]);
  }

  void addcartitem(index) {
    cartItems[index]['quantity']++;
    cartItems.refresh();
  }

  void removecartitem(index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
    }
    cartItems.refresh();
  }

  void deletecartitem(index) {
    cartItems.removeAt(index);
    cartItems.refresh();
  }

  double get subtotal {
    return cartItems.fold(
      0.0,
      (sum, item) => sum + ((item['price'] ?? 0) * (item['quantity'] ?? 0)),
    );
  }
}
