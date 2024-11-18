import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:maps_launcher/maps_launcher.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails({Key? key, required this.data}) : super(key: key);
  final List data;

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Container(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Text("Store Details".toUpperCase()),
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
                height: WidgetsBinding.instance.window.physicalSize.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        // decoration: BoxDecoration(
                        //   border: Border(
                        //     right: BorderSide(color: Colors.black, width: 0.5),
                        //   ),
                        // ),
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 204, 157, 118),
                          child: Icon(
                            Icons.store,
                            size: 80,
                            color: Colors.black,
                          ),
                          radius: 60,
                        ),
                      ),
                      Text(
                        "${widget.data[0]["store_name"]}".toUpperCase(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.data[0]["contact"]}".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.data[0]["email"]}".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.data[0]["timings"]}".toUpperCase(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text("(Open Every Day)"),
                      Text(
                        "${widget.data[0]["address1"]}".toUpperCase(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${widget.data[0]["address2"]}".toUpperCase(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      // ElevatedButton(
                      //   onPressed: () => MapsLauncher.launchCoordinates(
                      //       37.4220041,
                      //       -122.0862462,
                      //       'Google Headquarters are here'),
                      //   child: Text('View Location'),
                      // ),
                    ],
                  ),
                ))));
  }
}
