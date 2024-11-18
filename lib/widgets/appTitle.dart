import 'package:bhk_buyer_app/screens/homepage_management/dashboard.dart';
import 'package:flutter/material.dart';

import '../Constants/constants.dart';
// import 'package:untitled/Constants/constants.dart';
// import 'package:untitled/screens/dashboard.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image(
                color: Colors.white,
                width: 20,
                height: 30,
                image: AssetImage(Constant.Menu),
              ),
              //  const Icon(
              //   Icons.menu,
              //   color: Colors.red,
              //   size: 44, // Changing Drawer Icon Size
              // ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        // Icon(
        //   Icons.list,
        //   color: Colors.black,
        // ),
        Container(
          child: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoard()),
                  (route) => false);
            },
            child: Image.asset
                //  CircleAvatar(
                //     backgroundColor: Colors.transparent,
                //     foregroundColor: Colors.white,
                //     backgroundImage:
                (
              Constant.back,
              fit: BoxFit.contain,
              height: 38,
            ),
            // radius: 22),
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(builder: (context) => NotificationList()),
            //         (route) => false);
          },
          child: Image(
            color: Colors.white,
            width: 20,
            height: 30,
            image: AssetImage(Constant.Bell),
          ),
        )
      ],
    ));
  }
}
