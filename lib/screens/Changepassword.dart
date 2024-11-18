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
import 'package:csc_picker/csc_picker.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({Key? key}) : super(key: key);

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  String? oldpassword;
  String? newpassword;
  String? confirmpassword;
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;
  bool _obscurePassword3 = true; // Track password visibility

  final TextEditingController _oldpassword = TextEditingController();
  final TextEditingController _newpassword = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        iconTheme: const IconThemeData(color: Color(0xFF5D2E17)),
        centerTitle: true,
        title: Text(
          "Change Password".toUpperCase(),
          style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF5D2E17),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.white70,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Row
                  const Row(
                    children: [
                      SizedBox(width: 5),
                      Icon(
                        Icons.lock,
                        size: 20.0,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Change Password',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),

                  // Subtitle
                  const Text(
                    'Make your account secure.',
                    style: TextStyle(
                      fontSize: 11.0,
                      color: Color.fromARGB(255, 140, 136, 136),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Name Field
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Old Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        " *",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value == '') {
                        return '*Required Field! Please Enter Your Old Password';
                      }
                      return null;
                    },
                    cursorColor: Colors.grey,
                    cursorWidth: 1.5,
                    style: const TextStyle(height: 1),
                    controller: _oldpassword,
                    obscureText: _obscurePassword1, // Hide or show password
                    decoration: InputDecoration(
                      hintText: 'Enter your Old Password',
                      hintStyle: const TextStyle(fontSize: 12),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(82, 151, 92, 71),
                            width: 2.0), // Customize focused border
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword1
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword1 =
                                !_obscurePassword1; // Toggle visibility
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 3.0),
                  const Text(
                    'Give your system generated password or your old password',
                    style: TextStyle(
                      fontSize: 9.0,
                      color: Color.fromARGB(255, 140, 136, 136),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Create a New Password",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        " *",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value == '') {
                        return '*Required Field! Please Enter New Password';
                      }
                      return null;
                    },
                    cursorColor: Colors.grey,
                    cursorWidth: 1.5,
                    style: const TextStyle(height: 1),
                    controller: _newpassword,
                    obscureText: _obscurePassword2, // Hide or show password
                    decoration: InputDecoration(
                      hintText: 'Enter your New Password',
                      hintStyle: const TextStyle(fontSize: 12),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(82, 151, 92, 71),
                            width: 2.0), // Customize focused border
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword2
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword2 =
                                !_obscurePassword2; // Toggle visibility
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 3.0),
                  const Text(
                    'Give your New Password',
                    style: TextStyle(
                      fontSize: 9.0,
                      color: Color.fromARGB(255, 140, 136, 136),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Confirm Your Password",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        " *",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value == '') {
                        return '*Required Field! Please Enter Confirm Password';
                      }
                      return null;
                    },
                    cursorColor: Colors.grey,
                    cursorWidth: 1.5,
                    style: const TextStyle(height: 1),
                    controller: _confirmpassword,
                    obscureText: _obscurePassword3, // Hide or show password
                    decoration: InputDecoration(
                      hintText: 'Enter your Confirm Password',
                      hintStyle: const TextStyle(fontSize: 12),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(82, 151, 92, 71),
                            width: 2.0), // Customize focused border
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword3
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword3 =
                                !_obscurePassword3; // Toggle visibility
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 3.0),
                  const Text(
                    'Give your Confirm Password',
                    style: TextStyle(
                      fontSize: 9.0,
                      color: Color.fromARGB(255, 140, 136, 136),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text("Set as default Address"),
                  //     FlutterSwitch(
                  //       width: 40.0,
                  //       height: 18.0,
                  //       valueFontSize: 12.0,
                  //       toggleSize: 18.0,
                  //       padding: 1,
                  //       value: status4,
                  //       onToggle: (val) {
                  //         setState(() {
                  //           status4 = val;
                  //         });
                  //       },
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, perform the desired action
                            /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddProductprice()),
                        );*/
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5D2E17),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Change Password',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        /*floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
            'Add Address',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          onPressed: () {
            /*addaddress(
                      context,
                      _add1Controller.text,
                      _add2Controller.text,
                      _localityController.text,
                      _sublocalityController.text,
                      countryValue!,
                      stateValue!,
                      cityValue!,
                      int.parse(_pinController.text));*/
          },
        ),
      ),*/
      ),
    );
  }
}
