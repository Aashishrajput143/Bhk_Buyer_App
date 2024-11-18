import 'package:bhk_buyer_app/resources/images.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  var brands = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    brands.addAll([
      AppImages.brand1,
      AppImages.brand2,
      AppImages.brand3,
      AppImages.brand4,
      AppImages.brand5,
      AppImages.brand6,
      AppImages.brand7,
      AppImages.brand1,
      AppImages.brand2,
      AppImages.brand3,
      AppImages.brand4,
      AppImages.brand5,
      AppImages.brand6,
      AppImages.brand7,
      AppImages.brand1,
      AppImages.brand2,
      AppImages.brand3,
      AppImages.brand4,
      AppImages.brand5,
      AppImages.brand6,
      AppImages.brand7,
      AppImages.brand1,
      AppImages.brand2,
      AppImages.brand3,
      AppImages.brand4,
      AppImages.brand5,
      AppImages.brand6,
      AppImages.brand7,
    ]);
  }
}
