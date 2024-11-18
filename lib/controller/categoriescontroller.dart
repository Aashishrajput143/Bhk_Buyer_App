import 'dart:convert';

import 'package:bhk_buyer_app/Constants/utils.dart';
import 'package:bhk_buyer_app/common/CommonMethods.dart';
import 'package:bhk_buyer_app/data/response/status.dart';
import 'package:bhk_buyer_app/model/getcategorymodel.dart';
import 'package:bhk_buyer_app/repository/categoryrepository.dart';
import 'package:bhk_buyer_app/resources/images.dart';
import 'package:bhk_buyer_app/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final repository = CategoryRepository();
  var CategoriesItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    CategoriesItems.addAll([
      {
        "category": "Fashion",
        "categoryicon": Icons.local_mall_outlined,
        "color": Colors.blueAccent,
        "title": ['Latest', 'Mens', 'Womens', 'Kids'],
        "images": [
          AppImages.product1,
          AppImages.product2,
          AppImages.product3,
          AppImages.product4
        ],
      },
      {
        "category": 'Beauty',
        "categoryicon": Icons.brush_outlined,
        "color": Colors.pinkAccent,
        "title": ['Skincare', 'Haircare', 'Fragrance', 'Makeup'],
        "images": [
          AppImages.product5,
          AppImages.product6,
          AppImages.product7,
          AppImages.product9
        ],
      },
      {
        "category": 'Appliances',
        "categoryicon": Icons.tv_outlined,
        "color": Colors.yellowAccent,
        "title": ['Television', 'Washing', 'Refrigerator', 'Kitchen'],
        "images": [
          AppImages.product2,
          AppImages.product4,
          AppImages.product6,
          AppImages.product9
        ],
      },
      {
        "category": 'Furniture',
        "categoryicon": Icons.chair_outlined,
        "color": Colors.greenAccent,
        "title": ['Sofa Set', 'Dining Set', 'Laptop Table', 'Wardrobe'],
        "images": [
          AppImages.product3,
          AppImages.product5,
          AppImages.product1,
          AppImages.product7
        ],
      },
      {
        "category": 'Beauty',
        "categoryicon": Icons.brush_outlined,
        "color": Colors.pinkAccent,
        "title": ['Skincare', 'Haircare', 'Fragrance', 'Makeup'],
        "images": [
          AppImages.product5,
          AppImages.product6,
          AppImages.product7,
          AppImages.product9
        ],
      },
    ]);
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
}
