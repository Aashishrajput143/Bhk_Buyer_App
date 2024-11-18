// import 'dart:html';
import 'package:bhk_buyer_app/common/myUtils.dart';
import 'package:bhk_buyer_app/controller/profilecontroller.dart';
import 'package:bhk_buyer_app/data/response/status.dart';
import 'package:bhk_buyer_app/resources/images.dart';
import 'package:bhk_buyer_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainProfile extends StatelessWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Obx(() => Stack(children: [
          RefreshIndicator(
            color: Colors.brown,
            onRefresh: controller.profileRefresh,
            child: Column(
              children: [
                SizedBox(height: 30),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: controller
                              .getProfileModel.value.data?.avatar?.isNotEmpty ??
                          false
                      ? NetworkImage(
                          // Otherwise show the network image
                          controller.getProfileModel.value.data?.avatar ?? "")
                      : AssetImage(
                          AppImages.profile,
                        ),
                  radius: 70.0,
                ),
                SizedBox(height: 15),
                Text(
                  controller.getProfileModel.value.data?.name?.isNotEmpty ??
                          false
                      ? controller.getProfileModel.value.data?.name ?? ""
                      : "User".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  controller.getProfileModel.value.data?.email?.isNotEmpty ??
                          false
                      ? controller.getProfileModel.value.data?.email ?? ""
                      : "User@gmail.com",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading:
                            Icon(Icons.person_outline, color: Colors.black),
                        title:
                            Text("My Profile", style: TextStyle(fontSize: 16)),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          Get.toNamed(RoutesClass.gotoViewProfileScreen());
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on_outlined,
                            color: Colors.black),
                        title:
                            Text("My Address", style: TextStyle(fontSize: 16)),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_bag_outlined,
                            color: Colors.black),
                        title:
                            Text("My Orders", style: TextStyle(fontSize: 16)),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          Get.toNamed(RoutesClass.gotoOrderScreen());
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.credit_card_outlined,
                            color: Colors.black),
                        title: Text("My Cards", style: TextStyle(fontSize: 16)),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.settings_outlined, color: Colors.black),
                        title: Text("Settings", style: TextStyle(fontSize: 16)),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.logout, color: Colors.black),
                        title: Text("Log Out", style: TextStyle(fontSize: 16)),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          progressBarTransparent(
              controller.rxRequestStatus.value == Status.LOADING,
              MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.height)
        ]));
  }
}
