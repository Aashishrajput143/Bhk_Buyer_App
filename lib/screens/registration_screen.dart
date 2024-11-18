import 'dart:ui';

import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final TextEditingController _numController = TextEditingController();
  bool valuesecond = false;
  /* Future register(BuildContext context, String name, String email, String pass,
      String cpass, int num) async {
    final prefManager = await SharedPreferences.getInstance();

    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    final response = await http.post(
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
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Text(
                "register".toUpperCase(),
                style: TextStyle(fontSize: 15),
              ),
            ),
            body: Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border(top: BorderSide(color: Colors.grey, width: 5)),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(children: [
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Create your account",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "After your registration is complete,",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "you can see our opportunity products.",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _nameController,
                              // Use secure text for passwords.
                              decoration: new InputDecoration(
                                  hintText: 'Username', labelText: 'Username'),
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
                              controller: _passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscured,
                              focusNode: textFieldFocusNode,
                              // Use secure text for passwords.
                              decoration: new InputDecoration(
                                  suffixIcon: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                      child: GestureDetector(
                                        onTap: _toggleObscured,
                                        child: Icon(
                                          _obscured
                                              ? Icons.visibility_rounded
                                              : Icons.visibility_off_rounded,
                                          size: 24,
                                        ),
                                      )),
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
                            child: TextFormField(
                              controller: _cpasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscured,
                              focusNode: textFieldFocusNode,
                              // Use secure text for passwords.
                              decoration: new InputDecoration(
                                  suffixIcon: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                      child: GestureDetector(
                                        onTap: _toggleObscured,
                                        child: Icon(
                                          _obscured
                                              ? Icons.visibility_rounded
                                              : Icons.visibility_off_rounded,
                                          size: 24,
                                        ),
                                      )),
                                  hintText: 'confirm password',
                                  labelText: 'Confirm Password'),
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
                          SizedBox(height: 20),
                          Container(
                              height: 60,
                              width: 280,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              // margin:
                              // EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 204, 157, 118)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                // BorderRadius.zero,
                                                BorderRadius.circular(30)))),
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
                                      int.parse(_numController.text));*/
                                },
                              )),
                          Spacer(),
                          // Positioned(
                          //   // alignment: Alignment.bottomCenter,
                          //   bottom: 10,
                          //   child:

                          // )
                        ]))))));
  }
}
