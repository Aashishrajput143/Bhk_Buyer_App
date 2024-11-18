import 'dart:convert';

import 'package:bhk_buyer_app/Constants/utils.dart';
import 'package:bhk_buyer_app/common/CommonMethods.dart';
import 'package:bhk_buyer_app/data/response/status.dart';
import 'package:bhk_buyer_app/model/getcategorymodel.dart';
import 'package:bhk_buyer_app/repository/categoryrepository.dart';
import 'package:bhk_buyer_app/resources/images.dart';
import 'package:bhk_buyer_app/resources/strings.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboardcontroller extends GetxController {
  final repository = CategoryRepository();
  var bannerItems = <Map<String, String>>[].obs;
  var productItems = <Map<String, dynamic>>[].obs;
  var shopItems = <Map<String, String>>[].obs;
  var tabs = <Map<String, dynamic>>[].obs; // Reactive list
  var currentIndex = 0.obs; // Reactive index
  var sliderController =
      CarouselSliderController(); // Non-reactive, that's fine
  @override
  void onInit() {
    super.onInit();
    //getCategoryApi();
    // Add your banner items here or fetch them from an API
    bannerItems.addAll([
      {
        'imagePath': AppImages.dashboardbanner,
        'title': 'HAND MADE GIFTS',
        'subtitle': 'Discount 50% for \nthe first transaction',
        'discount': 'UP TO 50-60% OFF',
      },
      {
        'imagePath': AppImages.dashboardbanner,
        'title': 'BIGGEST SAVINGS ONLY HERE',
        'subtitle': 'Discount 50% for \nthe first transaction',
        'discount': 'UP TO 80% OFF',
      },
      {
        'imagePath': AppImages.dashboardbanner,
        'title': 'JEWELLERY & ACCESSORIES',
        'subtitle': 'Discount 50% for \nthe first transaction',
        'discount': 'UP TO 60-70% OFF',
      },
      {
        'imagePath': AppImages.dashboardbanner,
        'title': 'HOME DECOR & MORE',
        'subtitle': 'Discount 50% for \nthe first transaction',
        'discount': 'UP TO 60-70% OFF',
      },
    ]);
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
    ]);
    tabs.addAll([
      {
        "label": "All",
        "selected": false,
      },
      {
        "label": "Newest",
        "selected": true,
      },
      {
        "label": "Popular",
        "selected": false,
      },
      {
        "label": "Man",
        "selected": false,
      },
      {
        "label": "Women",
        "selected": false,
      },
      {
        "label": "Accessories",
        "selected": false,
      },
      {
        "label": "Clothes",
        "selected": false,
      },
      {
        "label": "Jeans",
        "selected": false,
      }
    ]);
    shopItems.addAll([
      {
        "imagePath": AppImages.product1,
        "title": 'Categories'.toUpperCase(),
      },
      {
        "imagePath": AppImages.product2,
        "title": 'Accessories'.toUpperCase(),
      },
      {
        "imagePath": AppImages.product3,
        "title": 'Clothes'.toUpperCase(),
      },
      {
        "imagePath": AppImages.product4,
        "title": 'Lifestyle'.toUpperCase(),
      },
      {
        "imagePath": AppImages.product5,
        "title": 'HandCraft'.toUpperCase(),
      },
      {
        "imagePath": AppImages.product6,
        "title": 'Jeans'.toUpperCase(),
      },
      {
        "imagePath": AppImages.product7,
        "title": 'Men'.toUpperCase(),
      },
      {
        "imagePath": AppImages.product8,
        "title": 'Women'.toUpperCase(),
      },
    ]);
  }

  void toggleWishlist(int index) {
    productItems[index]["Wishlist"] = !productItems[index]["Wishlist"];
    productItems.refresh(); // Toggle the value
  }

  void setError(String value) => error.value = value;
  RxString error = ''.obs;

  var isLoading = false.obs;
  final rxRequestStatus = Status.COMPLETED.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  final getCategoryModel = GetCategoryModel().obs;

  void setGetCategorydata(GetCategoryModel value) =>
      getCategoryModel.value = value;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    //getCategoryApi();
  }

  Future<void> getCategoryApi() async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      repository.getcategoryApi().then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setGetCategorydata(value);
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
