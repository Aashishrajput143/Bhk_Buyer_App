import 'dart:convert';

import 'package:bhk_buyer_app/Constants/constants.dart';
import 'package:bhk_buyer_app/screens/address_management/my_address.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditAddresses extends StatefulWidget {
  final List add;
  EditAddresses(this.add);

  @override
  State<EditAddresses> createState() => _EditAddressesState();
}

class _EditAddressesState extends State<EditAddresses> {
  initState() {
    // getDetails(context);
    _add1Controller.text = widget.add[0]["house_no"];
    _add2Controller.text = widget.add[0]["street"];
    _localityController.text = widget.add[0]["locality"];
    _sublocalityController.text = widget.add[0]["sub_locality"];
    _pinController.text = widget.add[0]["pin"].toString();
    _countryController.text = widget.add[0]["country"];
    _stateController.text = widget.add[0]["state"];
    _cityController.text = widget.add[0]["city"];
  }

  String? countryValue;
  String? stateValue;
  String? cityValue;
  bool status1 = false;
  bool status2 = true;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;

  final TextEditingController _add1Controller = TextEditingController();
  final TextEditingController _add2Controller = TextEditingController();
  final TextEditingController _localityController = TextEditingController();
  final TextEditingController _sublocalityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  /* Future editaddress(
      BuildContext context,
      String name,
      String email,
      String locality,
      String sublocality,
      String pass,
      String cpass,
      String city,
      int id,
      int num) async {
    final prefManager = await SharedPreferences.getInstance();

    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    print(login_token);
    final RegExp REGEX_EMOJI = RegExp(
        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');
    if (pass.contains(REGEX_EMOJI)) {
      pass = pass.replaceAll(REGEX_EMOJI, '');
    }
    print(pass);
    final response = await http.put(
      Uri.parse('${Constant.KEY_URL}/api/edit-address'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $login_token',
      },
      body: jsonEncode({
        'house_no': name,
        'street': email,
        'locality': locality,
        'sub_locality': sublocality,
        'country': pass.trim(),
        'state': cpass,
        'city': city,
        'pin': num,
        "address_id": id
      }),
    );

    if (response.statusCode == 200) {
      // print("dnfcdfmd $title");
      var data = jsonDecode(response.body);

      var rest = data["response"];
      var message1 = rest["message"];
      print(data);
      print(message1);

      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => VerifyOTP(title)));
      // return Album.fromJson(jsonDecode(response.body));
      Fluttertoast.showToast(
        msg: "$message1",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // _verifyPhone();
      // setState(() {
      //   isVerify = !isVerify;
      //   // addUser(context, _controller.text);
      // });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyAddresses()),
      );
      // ScopedModel.of<CartModel>(context, rebuildOnChange: true).clearCart();
    } else if (response.statusCode > 200) {
      var data = jsonDecode(response.body);

      var rest = data["response"];
      var message1 = rest["message"];
      print(data);
      print(message1);
      var code = rest["code"];
      print(data);
      print(code);
      print(message1);
      if (code == 401) {
        //  // prefManager.clear();

        prefManager.remove(Constant.KEY_LOGIN_TOKEN);
        prefManager.remove(Constant.KEY_IS_LOGIN);
        prefManager.remove(Constant.KEY_AVATAR_URL);
        prefManager.remove(Constant.KEY_USER_GROUP);
        prefManager.remove(Constant.KEY_USER_ID);
        Fluttertoast.showToast(
          msg: "$message1",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[400],
          textColor: Colors.white,
          fontSize: 16.0,
        );
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => DashBoard()),
        //     (route) => false);
      } else {
        Fluttertoast.showToast(
          msg: "$message1",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[400],
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Fluttertoast.showToast(
        msg: "Internal Server Error Please try again",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
      throw Exception('Failed to create album.');
    }
    // }
  }
*/
  @override
  Widget build(BuildContext context) {
    print(widget.add);
    return Container(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Text(
                "edit address".toUpperCase(),
                style: TextStyle(fontSize: 15),
              ),
            ),
            body: Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border(top: BorderSide(color: Colors.grey, width: 5)),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _add1Controller,
                    // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Enter House/Flat Number',
                        labelText: 'House/Flat Number'),
                    // validator: this._validatePassword,
                    // onSaved: (String value) {
                    //   this._data.password = value;
                    // }
                  ),

                  TextFormField(
                    controller: _add2Controller,
                    // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Enter Street', labelText: 'Street'),
                    // validator: this._validatePassword,
                    // onSaved: (String value) {
                    //   this._data.password = value;
                    // }
                  ),
                  TextFormField(
                    controller: _localityController,
                    // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Enter Locality', labelText: 'Locality'),
                    // validator: this._validatePassword,
                    // onSaved: (String value) {
                    //   this._data.password = value;
                    // }
                  ),
                  TextFormField(
                    controller: _sublocalityController,
                    // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Enter Sub-locality',
                        labelText: 'Sub-locality'),
                    // validator: this._validatePassword,
                    // onSaved: (String value) {
                    //   this._data.password = value;
                    // }
                  ),
                  TextFormField(
                    controller: _countryController,
                    // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Enter Country', labelText: 'Country'),
                    // validator: this._validatePassword,
                    // onSaved: (String value) {
                    //   this._data.password = value;
                    // }
                  ),
                  TextFormField(
                    controller: _stateController,
                    // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Enter state', labelText: 'State'),
                    // validator: this._validatePassword,
                    // onSaved: (String value) {
                    //   this._data.password = value;
                    // }
                  ),
                  TextFormField(
                    controller: _cityController,
                    // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Enter City', labelText: 'City'),
                    // validator: this._validatePassword,
                    // onSaved: (String value) {
                    //   this._data.password = value;
                    // }
                  ),

                  // Padding(
                  //   padding: EdgeInsets.only(top: 8),
                  //   child: SelectState(
                  //     // style: TextStyle(color: Colors.red),
                  //     onCountryChanged: (value) {
                  //       setState(() {
                  //         countryValue = value;
                  //       });
                  //     },
                  //     onStateChanged: (value) {
                  //       setState(() {
                  //         stateValue = value;
                  //       });
                  //     },
                  //     onCityChanged: (value) {
                  //       setState(() {
                  //         cityValue = value;
                  //       });
                  //     },
                  //   ),
                  // ),
                  TextFormField(
                    controller: _pinController,
                    // Use secure text for passwords.
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: new InputDecoration(
                        hintText: 'Pin Code', labelText: 'Pin Code'),
                    // validator: this._validatePassword,
                    // onSaved: (String value) {
                    //   this._data.password = value;
                    // }
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Set as default Address"),
                      FlutterSwitch(
                        width: 40.0,
                        height: 18.0,
                        valueFontSize: 12.0,
                        toggleSize: 18.0,
                        padding: 1,
                        value: status4,
                        onToggle: (val) {
                          setState(() {
                            status4 = val;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20.0),

                  // Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: TextFormField(
                  //     // controller: _addressController,
                  //     // Use secure text for passwords.
                  //     decoration: new InputDecoration(
                  //         hintText: 'Email', labelText: 'Email'),
                  //     // validator: this._validatePassword,
                  //     // onSaved: (String value) {
                  //     //   this._data.password = value;
                  //     // }
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: TextFormField(
                  //     // controller: _addressController,
                  //     // Use secure text for passwords.
                  //     decoration: new InputDecoration(
                  //         hintText: 'Phone', labelText: 'Phone'),
                  //     // validator: this._validatePassword,
                  //     // onSaved: (String value) {
                  //     //   this._data.password = value;
                  //     // }
                  //   ),
                ]))),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Container(
                height: 60,
                width: 280,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                // margin:
                // EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 204, 157, 118)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                                  // BorderRadius.zero,
                                  BorderRadius.circular(30)))),
                  child: const Text(
                    'Edit Address',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    /* editaddress(
                        context,
                        _add1Controller.text,
                        _add2Controller.text,
                        _localityController.text,
                        _sublocalityController.text,
                        _countryController.text,
                        _stateController.text,
                        _cityController.text,
                        widget.add[0]["address_id"],
                        int.parse(_pinController.text));*/
                  },
                ))));
  }
}
