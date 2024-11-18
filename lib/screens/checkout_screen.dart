import 'dart:convert';

import 'package:bhk_buyer_app/screens/thank_you_screen.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Constants/constants.dart';
import '../model/cartModel.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  initState() {
    // getDetails(context);
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final TextEditingController _numController = TextEditingController();

  final TextEditingController _add1Controller = TextEditingController();
  final TextEditingController _add2Controller = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  bool valuesecond = false;
  bool values = false;

  /* Future addaddress(BuildContext context, String name, String email,
      String pass, String cpass, String city, int num) async {
    final prefManager = await SharedPreferences.getInstance();

    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    print(login_token);
    final RegExp REGEX_EMOJI = RegExp(
        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');
    if (pass.contains(REGEX_EMOJI)) {
      pass = pass.replaceAll(REGEX_EMOJI, '');
    }
    print(pass);
    final response = await http.post(
      Uri.parse('${Constant.KEY_URL}/api/add-address'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $login_token',
      },
      body: jsonEncode({
        'address1': name,
        'address2': email,
        'country': pass.trim(),
        'state': cpass,
        'city': city,
        'pin': num
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
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => ThankYouPage()),
      //     (route) => false);
      // ScopedModel.of<CartModel>(context, rebuildOnChange: true).clearCart();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CheckoutPage()),
      );
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

  Future createOrder(BuildContext context, String payment, List items,
      int zone_id, double cartvalue) async {
    print(zone_id);
    print("________________________");
    print(items);

    final prefManager = await SharedPreferences.getInstance();

    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    final response = await http.post(
      Uri.parse('${Constant.KEY_URL}/api/create-order'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $login_token',
      },
      body: jsonEncode({
        'total': cartvalue,
        'cart_items': items,
        "payment_method": payment,
        'address_id': zone_id
      }),
    );

    if (response.statusCode == 200) {
      // print("dnfcdfmd $title");
      var data = jsonDecode(response.body);

      var rest = data["response"];
      var message1 = rest["message"];
      print("/????????????????????????????????????????");
      print("/????????????????????????????????????????");
      print("/????????????????????????????????????????");
      print("/????????????????????????????????????????");
      print("/????????????????????????????????????????");
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
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ThankYouPage()),
          (route) => false);
      ScopedModel.of<CartModel>(context, rebuildOnChange: true).clearCart();
    } else if (response.statusCode > 200) {
      var data = jsonDecode(response.body);
      print("/????????????????????????????????????????");
      print("/????????????????????????????????????????");
      print("/????????????????????????????????????????");
      print("/????????????????????????????????????????");
      print("/????????????????????????????????????????");
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
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DashBoard()),
            (route) => false);
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

  Future register(BuildContext context, String name, String email, String pass,
      String cpass, int num, bool status) async {
    final prefManager = await SharedPreferences.getInstance();

    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    final response = status
        ? await http.post(
            Uri.parse('${Constant.KEY_URL}/api/register'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              // 'Authorization': 'Bearer $login_token',
            },
            body: jsonEncode({
              'name': name,
              'email': email,
              'password': pass,
              'conf_password': cpass,
              'group_id': 1,
              'contact_no': num
            }),
          )
        : await http.post(
            Uri.parse('${Constant.KEY_URL}/api/register-without-password'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              // 'Authorization': 'Bearer $login_token',
            },
            body: jsonEncode({
              'name': name,
              'email': email,
              // 'password': pass,
              // 'conf_password': cpass,
              'group_id': 1,
              'contact_no': num
            }),
          );

    if (response.statusCode == 200) {
      // print("dnfcdfmd $title");
      var data = jsonDecode(response.body);

      var rest = data["response"];
      var message1 = rest["message"];
      print(data);
      print(message1);
      var login_token = message1["login_token"];
      var group = message1["user_name"];
      var email = message1["email"];
      var user_id = message1["user_id"];
      prefManager.setString(Constant.KEY_LOGIN_TOKEN, login_token);
      prefManager.setBool(Constant.KEY_IS_LOGIN, true);
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
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                width: 380,
                child: SingleChildScrollView(
                  child: Stack(
                    fit: StackFit.loose,
                    // overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.close),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Enter Shipping Address Details",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                            TextFormField(
                              controller: _add1Controller,
                              // Use secure text for passwords.
                              decoration: new InputDecoration(
                                  hintText: 'Enter Address Line 1',
                                  labelText: 'Address Line 1'),
                              // validator: this._validatePassword,
                              // onSaved: (String value) {
                              //   this._data.password = value;
                              // }
                            ),
                            TextFormField(
                              controller: _add2Controller,
                              // Use secure text for passwords.
                              decoration: new InputDecoration(
                                  hintText: 'Enter Address Line 2',
                                  labelText: 'Address Line 2'),
                              // validator: this._validatePassword,
                              // onSaved: (String value) {
                              //   this._data.password = value;
                              // }
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: SelectState(
                                // style: TextStyle(color: Colors.red),
                                onCountryChanged: (value) {
                                  setState(() {
                                    countryValue = value;
                                  });
                                },
                                onStateChanged: (value) {
                                  setState(() {
                                    stateValue = value;
                                  });
                                },
                                onCityChanged: (value) {
                                  setState(() {
                                    cityValue = value;
                                  });
                                },
                              ),
                            ),
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 60,
                                width: 423,
                                // color: Color.fromARGB(255, 193, 63, 41),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromARGB(255, 193, 63, 41)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ))),
                                  onPressed: () async {
                                    addaddress(
                                        context,
                                        _add1Controller.text,
                                        _add2Controller.text,
                                        countryValue!,
                                        stateValue!,
                                        cityValue!,
                                        int.parse(_pinController.text));
                                  },
                                  child: const Text('Submit',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
      // _verifyPhone();
      // setState(() {
      //   isVerify = !isVerify;
      //   // addUser(context, _controller.text);
      // });
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => ThankYouPage()),
      //     (route) => false);
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
  bool isNew = true;
  List<dynamic> object = [];
  bool? isLogin;
  /* Future getDetails(BuildContext context) async {
    final prefManager = await SharedPreferences.getInstance();
    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    print(login_token);
    setState(() {
      isLogin = prefManager.getBool(Constant.KEY_IS_LOGIN);
      print(isLogin);
    });
    final response = await http.get(
      Uri.parse('${Constant.KEY_URL}/api/get-profile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $login_token',
      },
    );

    if (response.statusCode == 200) {
      // print("dnfcdfmd $title");
      var res = jsonDecode(response.body);
      print(res);
      var respon = res["response"];
      var message = respon["message"];
      setState(() {
        object = [message];
        print(object[0]);
      });
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
  }

  Future login(BuildContext context, String email, String pass) async {
    final prefManager = await SharedPreferences.getInstance();
    var auth = 'Basic ' + base64Encode(utf8.encode('$email:$pass'));
    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    final response = await http.post(
      Uri.parse('${Constant.KEY_URL}/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': '$auth',
      },
    );

    if (response.statusCode == 200) {
      // print("dnfcdfmd $title");
      var data = jsonDecode(response.body);

      var rest = data["response"];
      var message1 = rest["message"];
      print(data);
      print(message1);
      var login_token = message1["login_token"];
      var group = message1["user_name"];
      var email = message1["email"];
      var user_id = message1["user_id"];
      prefManager.setString(Constant.KEY_LOGIN_TOKEN, login_token);
      prefManager.setBool(Constant.KEY_IS_LOGIN, true);
      prefManager.setString(Constant.KEY_USER_NAME, group);
      prefManager.setString(Constant.KEY_USER_EMAIL, email);
      prefManager.setInt(Constant.KEY_USER_ID, user_id);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CheckoutPage()));
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
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => ThankYouPage()),
      //     (route) => false);
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
  String smallSentence(String bigSentence) {
    if (bigSentence.length > 25) {
      return bigSentence.substring(0, 25) + '.....';
    } else {
      return bigSentence;
    }
  }

  bool status4 = false;
  String? countryValue;
  String? stateValue;
  String? cityValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Order Details".toUpperCase(),
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30),
          // padding: EdgeInsets.symmetric(horizontal: 20),
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
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Shipping To:".toUpperCase(),
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                isLogin == true
                    ? new Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "home address".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              // InkWell(
                              //     onTap: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => EditAddresses(
                              //                 [object[0]["address"][index]])),
                              //       );
                              //     },
                              //     child: Text(
                              //       "Change",
                              //       style: TextStyle(
                              //           color: Colors.green, fontSize: 16),
                              //     ))
                            ],
                          ),
                          object.isEmpty
                              ? Center(
                                  child: Image.asset(
                                  Constant.backss,
                                  height: 55.0,
                                  width: 55.0,
                                ))
                              : Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${object[0]["address"][0]["house_no"]}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // InkWell(
                                          //     onTap: () {
                                          //       deleteaddress(
                                          //           context,
                                          //           object[0]["address"][0]
                                          //               ["address_id"]);
                                          //     },
                                          //     child: Text(
                                          //       "Delete",
                                          //       style: TextStyle(
                                          //           color: Colors.red, fontSize: 16),
                                          //     ))
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            "${object[0]["address"][0]["street"]}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${object[0]["address"][0]["locality"]}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${object[0]["address"][0]["sub_locality"]}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            "${object[0]["address"][0]["city"]},${object[0]["address"][0]["pin"]},${object[0]["address"][0]["state"]},${object[0]["address"][0]["country"]}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                          // SizedBox(height: 20),
                          Divider(
                            height: 20,
                            thickness: 0.15,
                            endIndent: 0,
                            color: Colors.black,
                          ),
                        ]),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        child: isNew
                            ? Column(children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "Guest Checkout",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w700),
                                ),
                                // Text(
                                //   "After your registration is complete,",
                                //   style: TextStyle(fontSize: 15),
                                // ),
                                // Text(
                                //   "you can see our opportunity products.",
                                //   style: TextStyle(fontSize: 15),
                                // ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _nameController,
                                    // Use secure text for passwords.
                                    decoration: new InputDecoration(
                                        hintText: 'Name', labelText: 'Name'),
                                    // validator: this._validatePassword,
                                    // onSaved: (String value) {
                                    //   this._data.password = value;
                                    // }
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _emailController,
                                    // Use secure text for passwords.
                                    decoration: new InputDecoration(
                                        hintText: 'Email', labelText: 'Email'),
                                    // validator: this._validatePassword,
                                    // onSaved: (String value) {
                                    //   this._data.password = value;
                                    // }
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _numController,
                                    // Use secure text for passwords.
                                    decoration: new InputDecoration(
                                        hintText: 'Phone', labelText: 'Phone'),
                                    // validator: this._validatePassword,
                                    // onSaved: (String value) {
                                    //   this._data.password = value;
                                    // }
                                  ),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: values,
                                      onChanged: (value) {
                                        setState(() {
                                          values = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      "Register yourself",
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                                values
                                    ? Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: _passwordController,
                                          // Use secure text for passwords.
                                          decoration: new InputDecoration(
                                              hintText: 'password',
                                              labelText: 'Password'),
                                          // validator: this._validatePassword,
                                          // onSaved: (String value) {
                                          //   this._data.password = value;
                                          // }
                                        ),
                                      )
                                    : new Container(),
                                values
                                    ? Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: _cpasswordController,
                                          // Use secure text for passwords.
                                          decoration: new InputDecoration(
                                              hintText: 'confirm password',
                                              labelText: 'Confirm Password'),
                                          // validator: this._validatePassword,
                                          // onSaved: (String value) {
                                          //   this._data.password = value;
                                          // }
                                        ),
                                      )
                                    : new Container(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already a user?",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            isNew = false;
                                          });
                                        },
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                                SizedBox(height: 20),
                                Container(
                                    height: 60,
                                    width: 280,
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    // margin:
                                    // EdgeInsets.only(top: 10),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromARGB(
                                                      255, 204, 157, 118)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      // BorderRadius.zero,
                                                      BorderRadius.circular(
                                                          30)))),
                                      child: const Text(
                                        'SIGN UP',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      onPressed: () {
                                        /* register(
                                            context,
                                            _nameController.text,
                                            _emailController.text,
                                            _passwordController.text,
                                            _cpasswordController.text,
                                            int.parse(_numController.text),
                                            values);*/
                                      },
                                    )),
                                Spacer(),
                                // Positioned(
                                //   // alignment: Alignment.bottomCenter,
                                //   bottom: 10,
                                //   child:

                                // )
                              ])
                            : Column(children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "Let's sign you in",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Welcome back, you've been missed!",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _emailController,
                                    // Use secure text for passwords.
                                    decoration: new InputDecoration(
                                        hintText: 'email',
                                        labelText: 'Username or email'),
                                    // validator: this._validatePassword,
                                    // onSaved: (String value) {
                                    //   this._data.password = value;
                                    // }
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    // Use secure text for passwords.
                                    decoration: new InputDecoration(
                                        hintText: 'password',
                                        labelText: 'Password'),
                                    // validator: this._validatePassword,
                                    // onSaved: (String value) {
                                    //   this._data.password = value;
                                    // }
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: valuesecond,
                                            onChanged: (value) {
                                              setState(() {
                                                valuesecond = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                            "Remember me",
                                            style: TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                      Text("Forget Password?",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                    height: 60,
                                    width: 280,
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    // margin:
                                    // EdgeInsets.only(top: 10),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromARGB(
                                                      255, 204, 157, 118)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      // BorderRadius.zero,
                                                      BorderRadius.circular(
                                                          30)))),
                                      child: const Text(
                                        'SIGN IN',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      onPressed: () {
                                        // login(context, _emailController.text,
                                        //    _passwordController.text);
                                      },
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                // Spacer(),
                                // Positioned(
                                //   // alignment: Alignment.bottomCenter,
                                //   bottom: 10,
                                //   child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have a account?",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            isNew = true;
                                          });
                                        },
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                                SizedBox(height: 30)
                                // )
                              ])),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Order Details".toUpperCase(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),

                Container(
                    height: 150,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                        // scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: ScopedModel.of<CartModel>(context,
                                rebuildOnChange: true)
                            .total,
                        itemBuilder: ((context, index) {
                          return ScopedModelDescendant<CartModel>(
                              builder: (context, child, model) {
                            return Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              model.cart[index].imgUrl == ""
                                                  ? Container(
                                                      height: 100,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        // image: DecorationImage(
                                                        //     image:
                                                        //      NetworkImage(
                                                        //         model.cart[index]
                                                        //             .imgUrl),
                                                        //     fit: BoxFit.fill)
                                                      ),
                                                      child: Image.asset(
                                                          "assets/images/watermark.jpg"),
                                                    )
                                                  : Container(
                                                      height: 100,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  model
                                                                      .cart[
                                                                          index]
                                                                      .imgUrl),
                                                              fit:
                                                                  BoxFit.fill)),
                                                    ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // SizedBox(
                                                  //   height: 10,
                                                  // ),
                                                  Container(
                                                    child: Text(
                                                      "   ${smallSentence(model.cart[index].title)}",
                                                      maxLines: 5,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),

                                                  // Text(
                                                  //   "    Pure",
                                                  //   style:
                                                  //       TextStyle(color: Colors.black45),
                                                  // ),
                                                  // SizedBox(
                                                  //   height: 6,
                                                  // ),
                                                  Text(
                                                    "    ₹ ${model.cart[index].price}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  // SizedBox(
                                                  //   height: 30,
                                                  // ),
                                                  // Container(
                                                  //   // width: 270,
                                                  //   child: Row(
                                                  //     mainAxisAlignment:
                                                  //         MainAxisAlignment
                                                  //             .spaceBetween,
                                                  //     children: [
                                                  //       Container(
                                                  //         // width: 100,
                                                  //         alignment:
                                                  //             Alignment.center,
                                                  //         child: new Row(
                                                  //           mainAxisAlignment:
                                                  //               MainAxisAlignment
                                                  //                   .spaceEvenly,
                                                  //           crossAxisAlignment:
                                                  //               CrossAxisAlignment
                                                  //                   .center,
                                                  //           children: <Widget>[
                                                  //             new Text(
                                                  //                 "Quantity :" +
                                                  //                     model
                                                  //                         .cart[
                                                  //                             index]
                                                  //                         .qty
                                                  //                         .toString(),
                                                  //                 style: new TextStyle(
                                                  //                     fontSize:
                                                  //                         20.0)),
                                                  //           ],
                                                  //         ),
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ],
                                ));
                          });
                        }))),
                // Divider(
                //   height: 20,
                //   thickness: 1,
                //   endIndent: 0,
                //   color: Colors.black45,
                // ),

                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          // border: Border(top: BorderSide(color: Colors.grey, width: 5)),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          )),
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Price Details",
                          //       style: TextStyle(
                          //           fontSize: 20,
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "₹" +
                                    ScopedModel.of<CartModel>(context,
                                            rebuildOnChange: true)
                                        .totalCartValue
                                        .toString() +
                                    "",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // Divider(
                          //   height: 20,
                          //   thickness: 1,
                          //   endIndent: 0,
                          //   color: Colors.black45,
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Shipping",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                "Free",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                "C.O.D",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // Divider(
                          //   height: 20,
                          //   thickness: 1,
                          //   endIndent: 0,
                          //   color: Colors.black45,
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       "Payment Method",
                          //       style: TextStyle(fontSize: 16),
                          //     ),
                          //     Text(
                          //       "Pay On Delivery",
                          //       style: TextStyle(
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //   ],
                          // ),
                          // Divider(
                          //   height: 20,
                          //   thickness: 1,
                          //   endIndent: 0,
                          //   color: Colors.black45,
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total To Pay",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "₹" +
                                    ScopedModel.of<CartModel>(context,
                                            rebuildOnChange: true)
                                        .totalCartValue
                                        .toString() +
                                    "",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 20),
                            height: 60,
                            width: 240,
                            // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            // color: Color.fromARGB(255, 193, 63, 41),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 204, 157, 118)
                                      // Color.fromARGB(255, 193, 63, 41)
                                      ),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ))),
                              onPressed:
                                  //  isLoggedIn != true
                                  //     ? () async {
                                  //         setState(() {
                                  //           isNewUser = true;
                                  //         });
                                  //       }
                                  //     :
                                  () async {
                                // setState(() {
                                //   isNewUser = false;
                                // });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CheckoutPage()),
                                );

                                /*createOrder(
                                    context,
                                    "COD",
                                    ScopedModel.of<CartModel>(context,
                                            rebuildOnChange: true)
                                        .cart,
                                    object[0]["address"][0]["address_id"],
                                    ScopedModel.of<CartModel>(context,
                                            rebuildOnChange: true)
                                        .totalCartValue);
                                print(ScopedModel.of<CartModel>(context,
                                        rebuildOnChange: true)
                                    .totalCartValue);*/
                              },
                              child: Text(
                                  // isLoggedIn == true
                                  //     ?
                                  'PLACE ORDER'
                                  // : 'Proceed ▶'
                                  ,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
