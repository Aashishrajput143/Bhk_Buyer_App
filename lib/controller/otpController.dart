import 'dart:async';
import 'dart:convert';

import 'package:bhk_buyer_app/model/verifyOtpModel.dart';
import 'package:bhk_buyer_app/repository/otpRepository.dart';
import 'package:get/get.dart';

import '../Constants/utils.dart';
import '../common/CommonMethods.dart';
import '../common/Constants.dart';
import '../data/response/status.dart';
import '../model/signUpModel.dart';
import '../repository/loginRepository.dart';
import '../resources/strings.dart';
import '../routes/RoutesClass.dart';

class OtpController extends GetxController {
  final _api = OtpRepository();
  final _apiLogin = LoginRepository();
  var checkInternetValue = false.obs();
  final verifyOTPData = VerifyOTPModel().obs;
  dynamic errorMessage;
  var otp = "".obs;
  final logInData = SignUpModel().obs;

  void setLoginData(SignUpModel value) => logInData.value = value;
  final rxRequestStatus = Status.COMPLETED.obs;

  void setVerifyData(VerifyOTPModel value) => verifyOTPData.value = value;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  // final logInData = LoginModel().obs;
  RxString error = ''.obs;

  void setError(String value) => error.value = value;
  var startTime = 30.obs;
  var referenceId = 0.obs;
  var identity = "".obs;
  Timer? timer;
  var countryCode = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startTimerCountdown();
    referenceId.value = Get.arguments["referenceId"];
    identity.value = Get.arguments['identity'];
    if (Get.arguments['countryCode'] != null) {
      countryCode.value = Get.arguments['countryCode'];
    }
  }

  void startTimerCountdown() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (startTime.value == 0) {
          timer.cancel();
        } else {
          startTime.value--;
        }
      },
    );
  }

  Future<void> otpVerification(context) async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.COMPLETED);

      Map<String, dynamic> data = {
        "referenceId": referenceId.value,
        "otp": otp.value.toString()
      };
      _api.verifyOtpApi(data).then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setVerifyData(value);
        Utils.printLog("Response===> ${value.toString()}");
        redirect();
      }).onError((error, stackTrace) {
        Get.back();
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

  Future<void> resendOtp(context) async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.COMPLETED);

      Map<String, dynamic> data = {
        "identity": identity.value,
        "group": "SELLER",
        if (identity.value is num) "countryCode": countryCode.value
        // Assume you have the country code stored
      };
      _apiLogin.logInApi(data).then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setLoginData(value);
        Utils.printLog("Response===> ${value.toString()}");
      }).onError((error, stackTrace) {
        Get.back();
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

  redirect() {
    print("verifyOTPData.value.statusCode ==${verifyOTPData.value.statusCode}");
    //if (verifyOTPData.value.statusCode == 200) {
    Utils.savePreferenceValues(
        Constants.accessToken, "${verifyOTPData.value.data?.accessToken}");

    Utils.savePreferenceValues(
        Constants.email, "${verifyOTPData.value.data?.email}");
    //}
    Get.offNamed(RoutesClass.gotoDashboardScreen());
  }
}
