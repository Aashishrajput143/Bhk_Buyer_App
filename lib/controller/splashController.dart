import 'dart:async';

import 'package:get/get.dart';

import '../Constants/utils.dart';
import '../common/Constants.dart';
import '../routes/RoutesClass.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    navigate();
  }

  void navigate() {
    Utils.getPreferenceValues(Constants.accessToken).then((value) => {
          Utils.printLog("token $value"),
          if (value != "" && value != null)
            {
              Get.offAllNamed(RoutesClass.gotoDashboardScreen()),
              print("Route $value")
            }
          else
            {
              Timer(const Duration(seconds: 3),
                  () => Get.offAllNamed(RoutesClass.gotoDashboardScreen()))
            }
        });
  }
}
