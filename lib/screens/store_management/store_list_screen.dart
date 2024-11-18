import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constants/constants.dart';
import '../store_details_screen.dart';

class StoreListPage extends StatefulWidget {
  const StoreListPage({Key? key}) : super(key: key);

  @override
  State<StoreListPage> createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getStores(context);
  }

  List storeList = [];
  /* Future getStores(BuildContext context) async {
    final prefManager = await SharedPreferences.getInstance();
    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    print(login_token);
    final response = await http.get(
      Uri.parse('${Constant.KEY_URL}/api/store/get-store'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $login_token',
      },
    );

    if (response.statusCode == 200) {
      // print("dnfcdfmd $title");
      var res = jsonDecode(response.body);

      // print(res);
      var respon = res["response"];
      var message = respon["message"];

      print(message);

      setState(() {
        storeList = message;
      });

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
  String smallSentences(String bigSentence) {
    if (bigSentence.length > 8) {
      return bigSentence.substring(0, 8) + '...';
    } else {
      return bigSentence;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF5D2E17),
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
              title: Text("Stores".toUpperCase(),
                  style: const TextStyle(fontSize: 16, color: Colors.white)),
            ),
            body: Container(
                color: const Color.fromARGB(195, 247, 243, 233),
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Our Offline Stores ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     // Navigator.push(
                      //     //   context,
                      //     //   MaterialPageRoute(builder: (context) => MyProducts()),
                      //     // );
                      //   },
                      //   child: Container(
                      //     margin: EdgeInsets.all(10),
                      //     child: Text(
                      //       "See All >",
                      //       style: TextStyle(
                      //           // color: Color.fromARGB(255, 193, 63, 41),
                      //           color: Colors.green,
                      //           // fontWeight: FontWeight.bold,
                      //           fontSize: 20),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  ListView.builder(
                      // scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: storeList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        StoreDetails(data: [storeList[index]])),
                              );
                            },
                            child: Card(
                              margin: EdgeInsets.all(10),
                              child: Container(
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 6),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 193, 63, 41),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8),
                                            ) // green shaped
                                            ),
                                        child: Text(
                                          " ${index + 1}.",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 30),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                right: BorderSide(
                                                    color: Colors.black,
                                                    width: 0.5),
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              child: Icon(
                                                Icons.store,
                                                size: 50,
                                              ),
                                              //  GestureDetector(
                                              //   onTap: () async {
                                              //     // await showDialog(
                                              //     //     context: context,
                                              //     //     builder: (_) => imageDialog(
                                              //     //         '${farmerData[index]['name']} Profile Picture',
                                              //     //         farmerData[index]['avatar'],
                                              //     //         context));
                                              //   },
                                              // ),
                                              // backgroundImage:
                                              //     // AssetImage(
                                              //     //     Constant.Banner_Image3),
                                              //     CachedNetworkImageProvider(
                                              //         '${categoryList[index]['avatar']}'),
                                              radius: 40,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                              child: Column(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.spaceBetween,
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: <Widget>[
                                                  Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment
                                                    //         .spaceBetween,
                                                    // crossAxisAlignment:
                                                    //     CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        'Store Name : ',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            // fontWeight: FontWeight.w600,
                                                            fontFamily:
                                                                'Poppins-Bold',
                                                            fontSize: 15),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            textAlign:
                                                                TextAlign.start,
                                                            " ${smallSentences(storeList[index]['store_name'])}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                // fontWeight: FontWeight.w600,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 15),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'Timing : ',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            // fontWeight: FontWeight.w600,
                                                            fontFamily:
                                                                'Poppins-Bold',
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        '${storeList[index]['timings']} ',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            // fontWeight: FontWeight.w600,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment
                                                    //         .spaceBetween,
                                                    // crossAxisAlignment:
                                                    //     CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        "Phone No : ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'Poppins-Bold'),
                                                      ),

                                                      Text(
                                                        '${storeList[index]['contact']}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 5,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'Poppins'),
                                                      ),
                                                      // /),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 10,
                                        right: 0,
                                        // alignment: Alignment.bottomRight,
                                        child: Container(
                                          // margin: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 5,
                                              bottom: 5),
                                          margin: EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text("View More "),
                                        ))
                                  ],
                                ),
                              ),
                            )
                            // }
                            );
                      })
                ])))));
  }
}
