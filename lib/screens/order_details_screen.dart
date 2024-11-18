import 'dart:convert';
import 'dart:io';
import 'package:bhk_buyer_app/screens/homepage_management/dashboard.dart';
import 'package:bhk_buyer_app/screens/invoice_screen.dart';
import 'package:bhk_buyer_app/screens/orders_management/orders_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:async/async.dart';
import '../Constants/constants.dart';

class OrdersDetails extends StatefulWidget {
  final List object;
  const OrdersDetails({Key? key, required this.object}) : super(key: key);

  @override
  State<OrdersDetails> createState() => _OrdersDetailsState();
}

class _OrdersDetailsState extends State<OrdersDetails> {
  // @override
  // initState() {
  //   getDetails(context, '');
  //   // }
  // }
  String smallSentence(String bigSentence) {
    if (bigSentence.length > 15) {
      return bigSentence.substring(0, 15) + '.....';
    } else {
      return bigSentence;
    }
  }

  TextEditingController _cityController = TextEditingController();

  /* Future addRating(
      int id, double rating, String comment, String Subject) async {
    final prefManager = await SharedPreferences.getInstance();
    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    final response = await http.post(
      Uri.parse('${Constant.KEY_URL}/api/add-product-review'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $login_token',
      },
      body: jsonEncode({
        "product_id": id,
        "rating": rating,
        "comment": comment,
        "subject": Subject.toUpperCase()
      }),
    );
    if (response.statusCode == 200) {
      // print("dnfcdfmd $title");
      var res = jsonDecode(response.body);
      var resp = res["response"];
      var message = resp["message"];
      // var product = message["products"];
      print(message);
      setState(() {
        _cityController.text = "";
      });
      // setState(() {
      //   zoneList = message;
      //   print(zoneList[0]);
      // });
      // Navigator.pop(context);
      // setState(() {
      //   _zoneareaController.text = '';
      //   _zonenameController.text = '';
      // });
      // getDetails(context);
      Fluttertoast.showToast(
        msg: "$message",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrdersList()),
      );

      // ntfile.writeAsStringSync(json.encode(message),
      //     flush: true, encoding: utf8, mode: FileMode.write);
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

        // prefManager.remove(Constant.KEY_LOGIN_TOKEN);
        // prefManager.remove(Constant.KEY_IS_LOGIN);
        // prefManager.remove(Constant.KEY_AVATAR_URL);
        // prefManager.remove(Constant.KEY_USER_GROUP);
        // prefManager.remove(Constant.KEY_USER_ID);
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
      Fluttertoast.showToast(
        msg: "Something went wrong please try again.",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
      throw Exception('Failed to create album.');
    }
  }
*/
  String dropdownvalue = 'Quality';

  // List of items in our dropdown menu
  var items = [
    'Quality',
    'Price',
    'Service',
  ];
  double? _rating;
  IconData? _selectedIcon;
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'RETURN';
  final ImagePicker imgpicker = ImagePicker();
  int _value = 1;
  List<XFile>? imagefiles;
  // Group Value for Radio Button.
  int id = 1;
  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else if (pickedfiles.length > 10) {
        // Fluttertoast.showToast(
        //   msg: "please Select Upto 10 images",
        //   toastLength: Toast.LENGTH_SHORT,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: Colors.green[400],
        //   textColor: Colors.white,
        //   fontSize: 16.0,
        // );
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.object);
    return Container(
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
          padding: EdgeInsets.symmetric(horizontal: 20),
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
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Shipping Details:".toUpperCase(),
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "home address".toUpperCase(),
                //       style: TextStyle(
                //           color: Colors.green,
                //           fontSize: 16,
                //           fontWeight: FontWeight.w700),
                //     ),
                //   ],
                // ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 10),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             "${widget.object[0]["address"]["address1"]}",
                //             style: TextStyle(
                //                 fontSize: 14, fontWeight: FontWeight.bold),
                //           ),
                //           // InkWell(
                //           //     onTap: () {
                //           //       deleteaddress(
                //           //           context,
                //           //           object[0]["address"][0]
                //           //               ["address_id"]);
                //           //     },
                //           //     child: Text(
                //           //       "Delete",
                //           //       style: TextStyle(
                //           //           color: Colors.red, fontSize: 16),
                //           //     ))
                //         ],
                //       ),
                //       SizedBox(height: 5),
                //       Row(
                //         children: [
                //           Text(
                //             "${widget.object[0]["address"]["address2"]}",
                //             style: TextStyle(
                //                 fontSize: 14, fontWeight: FontWeight.bold),
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: 5),
                //       Row(
                //         children: [
                //           Text(
                //             "${widget.object[0]["address"]["city"]},${widget.object[0]["address"]["pin"]},${widget.object[0]["address"]["state"]},${widget.object[0]["address"]["country"]}",
                //             style: TextStyle(
                //                 fontSize: 14, fontWeight: FontWeight.bold),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 20),
                Divider(
                  height: 20,
                  thickness: 0.15,
                  endIndent: 0,
                  color: Colors.black,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Products:".toUpperCase(),
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.object[0]["cart_items"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(widget.object[0]
                                                    ["cart_items"][index]
                                                ["image_url"]),
                                            fit: BoxFit.fill)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Text(
                                        "   ${smallSentence(widget.object[0]["cart_items"][index]["product_name"])}"
                                            .toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),

                                      Text(
                                        "    ₹${widget.object[0]["cart_items"][index]["price"]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              _buildPopupDialog(
                                                  context,
                                                  widget.object[0]["cart_items"]
                                                      [index]["product_id"]),
                                        );
                                      },
                                      child: Text("Rate ")),
                                  InkWell(
                                      onTap: () {
                                        _displayDialog(
                                            context,
                                            widget.object[0]["cart_items"]
                                                [index]["product_id"],
                                            widget.object[0]["order_id"]);
                                      },
                                      child: Text("Return ")),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            height: 20,
                            thickness: 0.15,
                            endIndent: 0,
                            color: Colors.black,
                          ),
                        ]),
                      );
                    }),

                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Order Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Total Price :₹${widget.object[0]["total"]}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Payment Status :${widget.object[0]["payment_status"] == null ? "Not Paid" : "Paid"}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Payment Method :₹${widget.object[0]["payment_method"] == 'COD' ? "Pay On Delivery" : "Online"}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            margin: EdgeInsets.only(top: 180),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InvoiceScreens(
                                        bill: widget.object,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Get Invoice",
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 90, vertical: 10),
                                  backgroundColor:
                                      Color.fromARGB(255, 204, 157, 118),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ))),
                      ),
                    ),
                  ],
                )
              ]),
            )

            // )
          ]))),
    ));
  }

  Future addReturnRequest(BuildContext context, int product_id, int order_id,
      String reason, String type, List? images) async {
    final prefManager = await SharedPreferences.getInstance();
    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    String? group = prefManager.getString(Constant.KEY_USER_GROUP);
    Map<String, String> headers = {'Authorization': 'Bearer $login_token'};
    // print(heading);
    // print(type);

    var req = http.MultipartRequest(
        'POST', Uri.parse('${Constant.KEY_URL}/api/return-exchange-request'));
    if (images != null) {
      for (var file in images) {
        String fileName = file.path.split("/").last;
        // var stream = new http.ByteStream(Delegating)
        var stream =
            new http.ByteStream(DelegatingStream.typed(file.openRead()));

        // get file length

        var length = await file.length(); //imageFile is your image file
        print("File lenght - $length");
        print("fileName - $fileName");
        // multipart that takes file
        var multipartFileSign =
            new http.MultipartFile('files', stream, length, filename: fileName);

        req.files.add(multipartFileSign);
      }
    }
    // req.fields['title'] = heading.toString();
    req.fields['product_id'] = product_id.toString();
    req.fields['order_id'] = order_id.toString();
    req.fields['reason'] = reason.toString();
    req.fields['type'] = type.toString();

    req.headers.addAll(headers);
    // req.files.add(http.MultipartFile.fromBytes(
    //     'file', File(image.path).readAsBytesSync(),
    //     filename: image.path));
    if (images!.length < 10) {
      var respo = await req.send();

      // print(respo.statusCode);
      if (respo.statusCode == 200) {
        var res = await http.Response.fromStream(respo);
        final result = jsonDecode(res.body);
        var rest = result["response"];
        var message1 = rest["message"];
        print(respo);
        Fluttertoast.showToast(
          msg: "$message1",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green[400],
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => new DashBoard()),
        );
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => new MyDashboard()),
        //     (route) => false);
      } else if (respo.statusCode > 200) {
        var res = await http.Response.fromStream(respo);
        var data = jsonDecode(res.body);

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
        Fluttertoast.showToast(
          msg: "Internal Server Error Please try again",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green[400],
          textColor: Colors.white,
          fontSize: 16.0,
        );
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => new MyProductsList()),
        //     (route) => false);
        throw Exception('Failed to create album.');
      }
    } else {
      Fluttertoast.showToast(
        msg: "Please select maximum 10 images.",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context, int idd, int ids) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Return Product',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Container(
              height: 450,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Type:"),
                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'RETURN';
                              id = 1;
                            });
                          },
                        ),
                        Text(
                          'RETURN',
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        Radio(
                          value: 2,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'EXCHANGE';
                              id = 2;
                            });
                          },
                        ),
                        Text(
                          'EXCHANGE',
                          style: new TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: _textFieldController,
                      decoration:
                          InputDecoration(hintText: "Reason for the Return"),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 110, 99, 90)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ))),
                        onPressed: () {
                          openImages();
                        },
                        child: Text(
                          "Upload Images",
                          style: TextStyle(color: Colors.white),
                        )),
                    Text("Picked Files:"),
                    Divider(),
                    imagefiles != null
                        ? Container(
                            height: 300,
                            child: GridView.count(
                                // physics:
                                //     NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                // scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                mainAxisSpacing: 20,
                                // crossAxisSpacing: 20,
                                // childAspectRatio: 1,
                                //  mainAxisExtent: 390
                                children: List.generate(
                                    growable: false,
                                    imagefiles!.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 250,
                                      child: Column(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                setState(() => imagefiles!
                                                    .removeAt(index));
                                                // setState(() {
                                                //   imagefiles![index] =
                                                //       null;
                                                // });
                                              },
                                              child: Icon(Icons.close)),
                                          Image.file(
                                            File(imagefiles![index].path),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .25,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })))
                        : Container(),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              new ElevatedButton(
                child: new Text('SUBMIT'),
                onPressed: () {
                  addReturnRequest(context, idd, ids, _textFieldController.text,
                      radioButtonItem, imagefiles);
                  print(imagefiles);
                  print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                  print(radioButtonItem);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget _buildPopupDialog(BuildContext context, int id) {
    print(id);
    return new AlertDialog(
      title: const Text('Rate This Product'),
      content: new Container(
        width: 380,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subject:"),
                    DropdownButton(
                      value: dropdownvalue,
                      hint: Text("Select"),
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text("Rate"),
                  Container(
                    // padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RatingBar.builder(
                      initialRating: _rating ?? 0.0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                      itemBuilder: (context, _) => Icon(
                        _selectedIcon ?? Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        _rating = rating;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _cityController,
                  // Use secure text for passwords.
                  decoration: new InputDecoration(
                      hintText: 'Comment', labelText: 'Comment!!!'),
                  // validator: this._validatePassword,
                  // onSaved: (String value) {
                  //   this._data.password = value;
                  // }
                ),
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
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 193, 63, 41)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ))),
                    onPressed: () async {
                      // addRating(
                      //    id, _rating!, _cityController.text, dropdownvalue);
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
      ),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
