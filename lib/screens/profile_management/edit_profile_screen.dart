import 'dart:io';
import 'package:bhk_buyer_app/screens/homepage_management/dashboard.dart';
import 'package:bhk_buyer_app/screens/orders_management/orders_screen.dart';
import 'package:bhk_buyer_app/widgets/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../cart_screen.dart';
import 'main_profile.dart';

class EditProfile extends StatefulWidget {
  final List object;
  const EditProfile({Key? key, required this.object}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int _selectedScreenIndex = 3;
  List _screens = [
    {"screen": DashBoard(), "title": "DashBoard"},
    {"screen": CartPage(), "title": "Cart"},
    {"screen": OrdersList(), "title": "Orders"},
    {"screen": MainProfile(), "title": "My Account"}
  ];
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => _screens[_selectedScreenIndex]["screen"]),
    );
  }

  @override
  initState() {
    // getDetails(context);
    _nameController.text = widget.object[0]["name"];
    _emailController.text = widget.object[0]["email"];
    _phoneController.text = widget.object[0]["contact_no"].toString();
  }

  File? imagefile;
  Future goImage() async {
    try {
      final imagefile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (imagefile == null) return;

      final imageTemp = File(imagefile.path);

      setState(() => this.imagefile = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  /* Future CompleteProfile(
    BuildContext context,
    // String login_token,
    File? imagefile,
    String name,
    String number,
  ) async {
    final prefManager = await SharedPreferences.getInstance();

    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    String? group = prefManager.getString(Constant.KEY_USER_GROUP);
    print(group);
    Map<String, String> headers = {'Authorization': 'Bearer $login_token'};
    var req = http.MultipartRequest(
        'POST', Uri.parse('${Constant.KEY_URL}/api/add-details'));
    req.fields['name'] = name.toString();

    req.fields['contact_no'] = number.toString();

    req.headers.addAll(headers);
    // print(profession);
    if (imagefile != null) {
      req.files.add(http.MultipartFile.fromBytes(
          'file', File(imagefile.path).readAsBytesSync(),
          filename: imagefile.path));
    }
    var respo = await req.send();
    if (respo.statusCode == 200) {
      // var res = respo.body;
      var res = await http.Response.fromStream(respo);
      final result = jsonDecode(res.body);
      var rest = result["response"];
      var message1 = rest["message"];
      // print(data);
      print(message1);
      print(res);
      print(result);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => new DashBoard()),
          (route) => false);
      Fluttertoast.showToast(
        msg: "$message1",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
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

      throw Exception('Failed to create album.');
    }
  }
*/
  bool _status = true;
  bool? isLogin;
  final FocusNode myFocusNode = FocusNode();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  // int _selectedScreenIndex = 1;
  // late List _screens;
  // SingleValueDropDownController _cnt = SingleValueDropDownController();
  // String radioButtonItem = 'M';

  // Group Value for Radio Button.
  int id = 1;
  @override
  Widget build(BuildContext context) {
    print(widget.object);
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black,
          // automaticallyImplyLeading = true,
          title: Center(
              child: Text(
            "Edit Profile".toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 16),
          )),
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
              Container(
                // height: 200.0,
                // color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            imagefile != null
                                ? Container(
                                    alignment: Alignment(0.0, 2.5),
                                    child: CircleAvatar(
                                      // backgroundColor: Colors.white,
                                      backgroundImage:
                                          FileImage(imagefile!, scale: 1.0),
                                      // child: Container(
                                      // child: Image.file(
                                      //   imagefile!,
                                      //   height: 100,
                                      //   width: 100,

                                      // ),
                                      // ),
                                      radius: 70.0,
                                    ))
                                : Container(
                                    alignment: Alignment(0.0, 2.5),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://all-can-farm.s3.ap-southeast-1.amazonaws.com/avatar.png'),
                                      radius: 70.0,
                                    ),
                                  ),
                            // Image.network(
                            //     "${widget.details[0]["avatar"]}",
                            //     width: 150,
                            //     height: 150,
                            //     fit: BoxFit.fill),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 100.0, left: 90.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 20.0,
                                  child: IconButton(
                                    icon: const Icon(Icons.camera_alt),
                                    color: Colors.white,
                                    onPressed: () {
                                      goImage();
                                    },
                                  ),
                                )
                              ],
                            )),
                      ]),
                    ),
                    new Container(
                      // color: Color(0xffFFFFFF),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 25.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Personal Information',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Name',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Enter Your Name",
                                        ),
                                        controller: _nameController,
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Email',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                            hintText: "Enter Email ID"),
                                        controller: _emailController,
                                        enabled: false,
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Phone Number',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            hintText: "Enter your Number"),
                                        // enabled: false,
                                        controller: _phoneController,
                                      ),
                                    ),
                                  ],
                                )),
                            _getActionButtons(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]))),
        bottomNavigationBar: BottomMenu(
          selectedIndex: _selectedScreenIndex,
          onClicked: _selectScreen,
        ),
      ),
    );
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        Color.fromARGB(255, 204, 157, 118)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                // BorderRadius.zero,
                                BorderRadius.circular(30)))),
                child: new Text("Save"),
                onPressed: () {
                  setState(() {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                  //CompleteProfile(context, imagefile, _nameController.text,
                  //    _phoneController.text);
                  // print(widget.group);

                  // CompleteProfile(
                  //   context,
                  //   // widget.login_token,
                  //   imagefile,
                  //   _nameController.text,
                  //   _pinController.text,
                  //   _addressController.text,
                  //   _address2Controller.text,
                  //   _emailController.text,
                  //   _phoneController.text,
                  //   _cityController.text,
                  //   _stateController.text,
                  //   // widget.group
                  // );
                },
              )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 204, 157, 118)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                // BorderRadius.zero,
                                BorderRadius.circular(30)))),
                child: new Text("Cancel"),

                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                // ignore: unnecessary_new
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
