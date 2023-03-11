import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internshippractice/gameDetailsScreens.dart/bor/view.dart';
import '../Constants/colors.dart';
import '../Constants/images.dart';
import '../gameDetailsScreens.dart/marriage/view.dart';
import '../gameDetailsScreens.dart/pick3/view.dart';
import '../gameDetailsScreens.dart/pick4/view.dart';
import '../widgetss/circleAvatar.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: pinkColor,
          title: const Text("Lottery Types"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CarouselSlider(
                    items: [
                      Container(
                        height: 100.h,
                        width: 350.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                                image: sliderImg1, fit: BoxFit.fill)),
                      ),
                      Container(
                        height: 100.h,
                        width: 350.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                                image: sliderImg2, fit: BoxFit.fill)),
                      ),
                      Container(
                        height: 100.h,
                        width: 350.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                                image: sliderImg3, fit: BoxFit.fill)),
                      ),
                    ],
                    options: CarouselOptions(
                      autoPlay: true, //automatically play slider
                      autoPlayCurve: Curves.bounceInOut, //for animation
                      enlargeCenterPage: true, //center image visible in large
                      autoPlayInterval:
                          const Duration(seconds: 3), //move after 3 seconds
                    )),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const BorPage());
                    },
                    child: CircleAvatarW(
                      picktext: "Pick 2",
                      numText: "50X",
                    ),
                  ),
                  SizedBox(
                    width: 60.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => Pick3Page());
                    },
                    child: CircleAvatarW(
                      picktext: "Pick 3",
                      numText: "50X",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => Pick4Page());
                    },
                    child: CircleAvatarW(
                      picktext: "Pick 4",
                      numText: "50X",
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => MarriagePage());
                    },
                    child: CircleAvatarW(
                      picktext: "Marriage",
                      numText: "50X",
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
