import 'package:bhk_buyer_app/controller/dashboardcontroller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());
    return Obx(
      () => Column(
        children: [
          CarouselSlider(
            items: controller.bannerItems
                .map((item) => SizedBox(
                      width: double.infinity,
                      height: 180.0, // Adjust height as per your design
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: ClipRRect(
                          child: Container(
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(item[
                                    "imagePath"]!), // Replace with actual image
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item["title"]!,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 117, 78, 63),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  SizedBox(height: 8),
                                  Text(item["subtitle"]!,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 153, 119, 106),
                                      )),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 12),
                                      backgroundColor: Colors.brown,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Text('Shop Now',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
            carouselController: controller.sliderController,
            options: CarouselOptions(
              autoPlay: true, // Enables auto sliding
              autoPlayInterval:
                  const Duration(seconds: 3), // Slide every 3 seconds
              height: 190,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                controller.currentIndex.value = index;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.bannerItems.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () =>
                    controller.sliderController.animateToPage(entry.key),
                child: Container(
                  width: 20.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(
                            controller.currentIndex == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
