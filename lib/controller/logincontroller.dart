import 'dart:convert';

import 'package:bhk_buyer_app/model/signUpModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Constants/utils.dart';
import '../common/CommonMethods.dart';
import '../data/response/status.dart';
import '../repository/loginRepository.dart';
import '../resources/strings.dart';
import '../routes/RoutesClass.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var countryCode = "".obs;
  final _api = LoginRepository();
  var checkInternetValue = false.obs();
  var phoneNumberFocusNode = FocusNode().obs;
  var errorMessage = "".obs;
  final rxRequestStatus = Status.COMPLETED.obs;
  final logInData = SignUpModel().obs;
  void setError(String value) => error.value = value;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setLoginData(SignUpModel value) => logInData.value = value;

  var textFieldFocusNode = FocusNode().obs;
  var obscured = true.obs;
  void toggleObscured() {
    obscured.value = !obscured.value;

    // If the focus is on the text field, do not change focus
    if (textFieldFocusNode.value.hasPrimaryFocus) {
      return;
    }

    // Prevent focus changes if the eye icon is tapped
    textFieldFocusNode.value.canRequestFocus = false;
  }

  Future<void> logInAndRegister(context) async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.COMPLETED);

      Map<String, dynamic> data = {
        "identity": emailController.value.text.isNotEmpty
            ? emailController.value.text
            : phoneController.value.text.toString(),
        "group": "USER",
        if (phoneController.value.text.isNotEmpty)
          "countryCode": countryCode.value
              .toString() // Assume you have the country code stored
      };
      _api.logInApi(data).then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setLoginData(value);
        CommonMethods.showToast(value.message);
        Utils.printLog("Response===> ${value.toString()}");
        print("redirect");
        redirect();
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

  void redirect() {
    print("redirect");
    print(logInData.value.statusCode);
    Get.offAllNamed(RoutesClass.gotoVerifyScreen(), arguments: {
      'referenceId': logInData.value.data?.referenceId,
      "identity": emailController.value.text.isNotEmpty
          ? emailController.value.text
          : phoneController.value.text,
      if (phoneController.value.text.isNotEmpty)
        "countryCode": countryCode.value
    });
  }
}
