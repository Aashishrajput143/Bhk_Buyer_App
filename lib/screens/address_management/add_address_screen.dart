import 'package:bhk_buyer_app/controller/addaddresscontroller.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:csc_picker/csc_picker.dart';

class AddAddresses extends StatelessWidget {
  const AddAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    AddressController controller = Get.put(AddressController());
    return Obx(
      () => Container(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.0), // AppBar height
            child: Material(
              elevation: 4.0, // Adjust elevation for shadow
              shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
              child: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                iconTheme: const IconThemeData(color: Color(0xFF5D2E17)),
                title: Text(
                  "New Address".toUpperCase(),
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF5D2E17)),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border,
                        color: Color(0xFF5D2E17)),
                    onPressed: () {
                      Get.toNamed(RoutesClass.gotoWishlistScreen());
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none,
                        color: Color(0xFF5D2E17)),
                    onPressed: () {
                      Get.toNamed(RoutesClass.gotoNotificationScreen());
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined,
                        color: Color(0xFF5D2E17)),
                    onPressed: () {
                      Get.offAllNamed(RoutesClass.gotoCartScreen());
                    },
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Row
                    const Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          Icons.store,
                          size: 20.0,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Add Address',
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),

                    // Subtitle
                    const Text(
                      'Add your new Address.',
                      style: TextStyle(
                        fontSize: 11.0,
                        color: Color.fromARGB(255, 140, 136, 136),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    // Name Field
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "House/Flat Number",
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
                          return '*Required Field! Please enter House/Flat Number';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey,
                      cursorWidth: 1.5,
                      style: const TextStyle(height: 1),
                      controller: controller.add1Controller.value,
                      decoration: const InputDecoration(
                        hintText: 'Enter House/Flat Number',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0), // Customize border color and width
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(82, 151, 92, 71),
                              width:
                                  2.0), // Customize border color and width when focused
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.0),
                    const Text(
                      'Give your House/Flat Number',
                      style: TextStyle(
                        fontSize: 9.0,
                        color: Color.fromARGB(255, 140, 136, 136),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Street",
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
                          return '*Required Field! Please enter Street';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey,
                      cursorWidth: 1.5,
                      style: const TextStyle(height: 1),
                      controller: controller.add2Controller.value,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Street',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0), // Customize border color and width
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(82, 151, 92, 71),
                              width:
                                  2.0), // Customize border color and width when focused
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.0),
                    const Text(
                      'Give your Street',
                      style: TextStyle(
                        fontSize: 9.0,
                        color: Color.fromARGB(255, 140, 136, 136),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Locality",
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
                          return '*Required Field! Please Enter Locality';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey,
                      cursorWidth: 1.5,
                      style: const TextStyle(height: 1),
                      controller: controller.localityController.value,
                      decoration: const InputDecoration(
                        hintText: 'Enter Locality',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0), // Customize border color and width
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(82, 151, 92, 71),
                              width:
                                  2.0), // Customize border color and width when focused
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.0),
                    const Text(
                      'Give your Locality',
                      style: TextStyle(
                        fontSize: 9.0,
                        color: Color.fromARGB(255, 140, 136, 136),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Sub-Locality",
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
                          return '*Required Field! Please Enter Sub-Locality';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey,
                      cursorWidth: 1.5,
                      style: const TextStyle(height: 1),
                      controller: controller.sublocalityController.value,
                      decoration: const InputDecoration(
                        hintText: 'Enter Sub-Locality',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0), // Customize border color and width
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(82, 151, 92, 71),
                              width:
                                  2.0), // Customize border color and width when focused
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.0),
                    const Text(
                      'Give your Sub-Locality',
                      style: TextStyle(
                        fontSize: 9.0,
                        color: Color.fromARGB(255, 140, 136, 136),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: CSCPicker(
                        ///Enable disable state dropdown [OPTIONAL PARAMETER]
                        showStates: true,

                        /// Enable disable city drop down [OPTIONAL PARAMETER]
                        showCities: true,
                        layout: Layout.vertical,

                        ///Enable (get flat with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                        flagState: CountryFlag.DISABLE,

                        ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                        dropdownDecoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.2,
                              color: Color.fromARGB(255, 130, 127, 127),
                            ),
                            top: BorderSide(
                              width: 1.2,
                              color: Color.fromARGB(255, 130, 127, 127),
                            ),
                            left: BorderSide(
                              width: 1.2,
                              color: Color.fromARGB(255, 130, 127, 127),
                            ),
                            right: BorderSide(
                              width: 1.2,
                              color: Color.fromARGB(255, 130, 127, 127),
                            ),
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(8)), // Add border radius
                        ),

                        ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                        disabledDropdownDecoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.2,
                              color: Color.fromARGB(255, 130, 127, 127),
                            ),
                            top: BorderSide(
                              width: 1.2,
                              color: Color.fromARGB(255, 130, 127, 127),
                            ),
                            left: BorderSide(
                              width: 1.2,
                              color: Color.fromARGB(255, 130, 127, 127),
                            ),
                            right: BorderSide(
                              width: 1.2,
                              color: Color.fromARGB(255, 130, 127, 127),
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),

                        ///selected item style [OPTIONAL PARAMETER]
                        selectedItemStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),

                        ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                        dropdownHeadingStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),

                        ///DropdownDialog Item style [OPTIONAL PARAMETER]
                        dropdownItemStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),

                        ///Dialog box radius [OPTIONAL PARAMETER]
                        dropdownDialogRadius: 10.0,

                        ///Search bar radius [OPTIONAL PARAMETER]
                        searchBarRadius: 10.0,

                        ///triggers once country selected in dropdown
                        onCountryChanged: (value) {
                          ///store value in country variable
                          controller.countryValue = value;
                        },

                        ///triggers once state selected in dropdown
                        onStateChanged: (value) {
                          ///store value in state variable
                          controller.stateValue = value;
                        },

                        ///triggers once city selected in dropdown
                        onCityChanged: (value) {
                          ///store value in city variable
                          controller.cityValue = value;
                        },
                      ),

                      // SelectState(
                      //   // style: TextStyle(color: Colors.red),
                      //   onCountryChanged: (value) {
                      //     setState(() {
                      //       countryValue = value;
                      //     });
                      //   },
                      //   onStateChanged: (value) {
                      //     setState(() {
                      //       stateValue = value;
                      //     });
                      //   },
                      //   onCityChanged: (value) {
                      //     setState(() {
                      //       cityValue = value;
                      //     });
                      //   },
                      // ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Pin Code",
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
                          return '*Required Field! Please Enter Pin Code';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey,
                      cursorWidth: 1.5,
                      style: const TextStyle(height: 1),
                      controller: controller.pinController.value,
                      decoration: const InputDecoration(
                        hintText: 'Enter Pin Code',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0), // Customize border color and width
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(82, 151, 92, 71),
                              width:
                                  2.0), // Customize border color and width when focused
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.0),
                    const Text(
                      'Give your Pin Code',
                      style: TextStyle(
                        fontSize: 9.0,
                        color: Color.fromARGB(255, 140, 136, 136),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Set as default Address"),
                        FlutterSwitch(
                          width: 40.0,
                          height: 18.0,
                          valueFontSize: 12.0,
                          toggleSize: 18.0,
                          padding: 1,
                          value: controller.status4.value,
                          onToggle: (val) {
                            controller.status4.value = val;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.92, 50),
                        backgroundColor: const Color(0xFF5D2E17),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                      ),
                      child: Text(
                        'Add Address',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
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
      ),
    );
  }
}
