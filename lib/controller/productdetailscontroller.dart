import 'dart:convert';

import 'package:bhk_buyer_app/Constants/utils.dart';
import 'package:bhk_buyer_app/common/CommonMethods.dart';
import 'package:bhk_buyer_app/data/response/status.dart';
import 'package:bhk_buyer_app/model/productdetailsmodel.dart';
import 'package:bhk_buyer_app/repository/productrepository.dart';
import 'package:bhk_buyer_app/resources/images.dart';
import 'package:bhk_buyer_app/resources/strings.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductPreviewController extends GetxController {
  final repository = ProductRepository();
  var currentIndex = 0.obs;
  var slidercontroller = CarouselSliderController();

  var productItems = <Map<String, dynamic>>[].obs;
  var reviewItems = <Map<String, dynamic>>[].obs;
  var reviews = <Map<String, dynamic>>[].obs;
  var styleWithItems = <Map<String, dynamic>>[].obs;
  var alsoBoughtItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    //getCategoryApi();
    // Add your banner items here or fetch them from an API
    productItems.addAll([
      {
        "imagePath": [
          AppImages.product1,
          AppImages.product2,
          AppImages.product3,
          AppImages.product4
        ],
        "title": "Antique Old Brass Vessel",
        "finalPrice": "Rs.15000",
        "price": "Rs.25000",
        "rating": "4.5",
        "reviewCount": "108",
        "discount": "20%Off"
      },
    ]);

    reviewItems.addAll([
      {
        "title": "Fit",
        "labels": [
          'Tight',
          'A Little Tight',
          'Just Right',
          'A Little Loose',
          'Loose'
        ],
        "values": [0, 0, 0.89, 0.11, 0],
      },
      {
        "title": "Length",
        "labels": [
          'Short',
          'A Little Short',
          'Just Right',
          'A Little Long',
          'Long'
        ],
        "values": [0, 0.13, 0.87, 0, 0],
      },
      {
        "title": "Transparency",
        "labels": ['Low', 'Medium', 'High'],
        "values": [0.75, 0.25, 0],
      },
    ]);
    reviews.addAll(
      [
        {
          "rating": "4",
          "time": "10 months ago",
          "comment": "Very comfortable",
          "size": "S",
          "name": "Sakila N"
        },
        {
          "rating": "5",
          "time": "5 months ago",
          "comment": "Excellent, I love it",
          "size": "S",
          "name": "Aiswarya"
        },
        {
          "rating": "5",
          "time": "10 months ago",
          "comment":
              "Amazing 😃 and delivery guy is always as expected ⭐⭐⭐⭐⭐ Kind",
          "size": "M",
          "name": "Karishma Magar"
        },
        {
          "rating": "5",
          "time": "a year ago",
          "comment": "Beautiful dress. Comfortable fabric. Best for summer.",
          "size": "L",
          "name": "SANGITA DOLEY"
        },
      ],
    );
    styleWithItems.addAll([
      {
        "image": AppImages.product3,
        "title": "Jersey thong body",
        "price": "Rs. 799.00"
      },
      {
        "image": AppImages.product4,
        "title": "Leather flip-flops",
        "price": "Rs. 4,499.00",
        "subtitle": "Premium Selection"
      },
      {
        "image": AppImages.product5,
        "title": "Beaded handbag",
        "price": "Rs. 2,499.00"
      },
      {
        "image": AppImages.product3,
        "title": "Jersey thong body",
        "price": "Rs. 799.00"
      },
      {
        "image": AppImages.product4,
        "title": "Leather flip-flops",
        "price": "Rs. 4,499.00",
        "subtitle": "Premium Selection"
      },
      {
        "image": AppImages.product5,
        "title": "Beaded handbag",
        "price": "Rs. 2,499.00"
      },
    ]);
    alsoBoughtItems.addAll([
      {
        "image": AppImages.product6,
        "title": "Flared skirt",
        "price": "Rs. 1,999.00"
      },
      {
        "image": AppImages.product7,
        "title": "Jersey skirt",
        "price": "Rs. 1,799.00"
      },
      {
        "image": AppImages.product8,
        "title": "Flared skirt",
        "price": "Rs. 1,999.00"
      },
      {
        "image": AppImages.product6,
        "title": "Flared skirt",
        "price": "Rs. 1,999.00"
      },
      {
        "image": AppImages.product7,
        "title": "Jersey skirt",
        "price": "Rs. 1,799.00"
      },
      {
        "image": AppImages.product8,
        "title": "Flared skirt",
        "price": "Rs. 1,999.00"
      },
    ]);
  }

  Widget buildSection(
      String title, String title2, String content, String content2) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                content2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  var selectedColorIndex = 2.obs;
  var selectedSizeIndex = 2.obs;

  // Available colors and sizes
  final List<Color> colors = [
    Colors.grey,
    Colors.black,
    Colors.orange,
    Colors.red,
    Colors.purple,
  ];

  final List<String> selectedcolors = [
    "Grey",
    "Black",
    "Orange",
    "Red",
    "Purple",
  ];

  final List<String> sizes = ["XS", "S", "M", "L", "XL", "XXL", "3XL"];

  int indexs = 1;

  var isLoading = false.obs;
  var isProductAdded = false.obs;
  final rxRequestStatus = Status.COMPLETED.obs;
  final getProductDetailsModel = ProductDetailsModel().obs;

  void setError(String value) => error.value = value;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setGetProductDetailsdata(ProductDetailsModel value) =>
      getProductDetailsModel.value = value;

  Future<void> getproductDetailsApi(productId) async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      repository.getproductdetailsApi(productId).then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setGetProductDetailsdata(value);
        CommonMethods.showToast(value.message);
        Utils.printLog("Response===> ${value.toString()}");
        print("redirect");
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        if (error.toString().contains("{")) {
          var errorResponse = json.decode(error.toString());
          print("errrrorrr=====>$errorResponse");
          if (errorResponse is Map || errorResponse.containsKey('message')) {
            CommonMethods.showToast(errorResponse['message']);
          } else {
            CommonMethods.showToast("An unexpected error occurred.");
          }
        }
        Utils.printLog("Error===> ${error.toString()}");
      });
    } else {
      CommonMethods.showToast(appStrings.weUnableCheckData);
    }
  }

  Widget productDetailRow(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$title :'),
          Text(detail),
        ],
      ),
    );
  }
}
