import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  String? countryValue;
  String? stateValue;
  String? cityValue;
  var status1 = false.obs;
  var status2 = true.obs;
  var status3 = false.obs;
  var status4 = false.obs;
  var status5 = false.obs;
  var status6 = false.obs;

  var add1Controller = TextEditingController().obs;
  var add2Controller = TextEditingController().obs;
  var localityController = TextEditingController().obs;
  var sublocalityController = TextEditingController().obs;
  var pinController = TextEditingController().obs;
}
