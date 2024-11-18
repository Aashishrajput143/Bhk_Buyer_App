import 'package:bhk_buyer_app/controller/otpController.dart';
import 'package:bhk_buyer_app/main.dart';
import 'package:bhk_buyer_app/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../Constants/constants.dart';
import '../resources/colors.dart';
import '../resources/font.dart';

class Otpscreen extends ParentWidget {
  OtpController controller = Get.put(OtpController());
  @override
  Widget buildingView(BuildContext context, double h, double w) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Obx(() => Scaffold(
          extendBodyBehindAppBar: true,
          body: SafeArea(
            child: Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image.asset(
                    Constant.backgroundImage,
                    height: MediaQuery.of(context).size.height * 0.99,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit
                        .cover, // Ensures the background image covers the entire area.
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/loader1.gif',
                            width: 150,
                            height: 150,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            appStrings.phoneVerification,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "We need to register your phone without getting started!",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Pinput(
                            length: 6,
                            // defaultPinTheme: defaultPinTheme,
                            // focusedPinTheme: focusedPinTheme,
                            // submittedPinTheme: submittedPinTheme,

                            showCursor: true,
                            onCompleted: (pin) {
                              controller.otp.value = pin.toString();
                            },
                          ),
                          SizedBox(
                              width: w * 0.8,
                              child: controller.startTime.value > 0
                                  ? Text(
                                      appStrings.reSendCode +
                                          controller.startTime.value
                                              .toString() +
                                          ' sec',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        controller.resendOtp(context);
                                      },
                                      child: Text(
                                        appStrings.reSend,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ))),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        const Color.fromARGB(
                                            255, 204, 157, 118)),
                                    foregroundColor: WidgetStateProperty.all(
                                        const Color.fromARGB(
                                            255, 255, 255, 255)),
                                    shape: WidgetStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                // BorderRadius.zero,
                                                BorderRadius.circular(30)))),
                                onPressed: () {
                                  controller.otpVerification(context);
                                },
                                child: const Text("Verify Phone Number")),
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    appStrings.editNumber,
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
