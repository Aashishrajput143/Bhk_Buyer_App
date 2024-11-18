import 'package:bhk_buyer_app/resources/images.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orderItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    orderItems.addAll([
      {
        "orderNumber": 'TB-124363893-93876378',
        "status": "Delivered",
        "date": '3rd Jun, 2024',
        "productName": 'Logan Crochet Outer Wear',
        "size": 'M',
        "color": 'Red',
        "currentPrice": 15000,
        "originalPrice": 25000,
        "returnAvailable": 'Exchange/Return available till 17 Jun',
        "showActions": true,
        "imagePath": AppImages.product3,
      },
      {
        "orderNumber": 'TB-124363893-93876378',
        "status": 'Preparing To Pack',
        "date": '25th May, 2024',
        "productName": 'Logan Crochet Outer Wear',
        "size": 'M',
        "color": 'Blue',
        "currentPrice": 2499.00,
        "originalPrice": 3299.00,
        "returnAvailable": '',
        "showActions": false,
        "imagePath": AppImages.product4,
      },
      {
        "orderNumber": 'TB-124363893-93876378',
        "status": "Package in Transit",
        "date": '3rd Jun, 2024',
        "productName": 'Logan Crochet Outer Wear',
        "size": 'M',
        "color": 'Green',
        "currentPrice": 15000,
        "originalPrice": 25000,
        "returnAvailable": 'Exchange/Return available till 17 Jun',
        "showActions": true,
        "imagePath": AppImages.product5,
      },
      {
        "orderNumber": 'TB-124363893-93876378',
        "status": "Delivered",
        "date": '3rd Jun, 2024',
        "productName": 'Logan Crochet Outer Wear',
        "size": 'M',
        "color": 'Purple',
        "currentPrice": 15000,
        "originalPrice": 25000,
        "returnAvailable": 'Exchange/Return available till 17 Jun',
        "showActions": true,
        "imagePath": AppImages.product6,
      },
    ]);
  }
}
