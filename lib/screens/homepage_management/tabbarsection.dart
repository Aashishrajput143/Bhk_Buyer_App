import 'package:bhk_buyer_app/controller/dashboardcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 45,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: controller.tabs.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                  right: 8.0, top: 5), // Add spacing between buttons
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 25.5),
                  backgroundColor: controller.tabs[index]["selected"]
                      ? Colors.brown
                      : Colors.white,
                  foregroundColor: controller.tabs[index]["selected"]
                      ? Colors.white
                      : Colors.brown,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: controller.tabs[index]["selected"]
                          ? Colors.brown
                          : Colors.grey.shade300,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: Text(
                  controller.tabs[index]["label"],
                  style: TextStyle(fontSize: 11),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
