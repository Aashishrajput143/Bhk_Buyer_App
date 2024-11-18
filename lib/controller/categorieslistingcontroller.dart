import 'dart:convert';

import 'package:bhk_buyer_app/Constants/utils.dart';
import 'package:bhk_buyer_app/common/CommonMethods.dart';
import 'package:bhk_buyer_app/data/response/status.dart';
import 'package:bhk_buyer_app/model/getcategorymodel.dart';
import 'package:bhk_buyer_app/repository/categoryrepository.dart';
import 'package:bhk_buyer_app/resources/images.dart';
import 'package:bhk_buyer_app/resources/strings.dart';
import 'package:get/get.dart';

class CategorieslistingController extends GetxController {
  final repository = CategoryRepository();
  var categoriesItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    categoriesItems.addAll([
      {"image": AppImages.product1, "label": "Grills & Smokers"},
      {"image": AppImages.product2, "label": "Patio Furniture"},
      {"image": AppImages.product3, "label": "Outdoor Heating"},
      {"image": AppImages.product4, "label": "Coolers"},
      {"image": AppImages.product5, "label": "Outdoor Décor"},
      {
        "image": AppImages.product6,
        "label": "Swimming Pools, Spa, and Supplies"
      },
      {"image": AppImages.product7, "label": "Sporting Goods"},
      {"image": AppImages.product8, "label": "Pond Supplies"},
      {"image": AppImages.product9, "label": "Bird & Wildlife Supplies"},
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
