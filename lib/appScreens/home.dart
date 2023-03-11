// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internshippractice/Constants/icons.dart';
import 'package:internshippractice/Constants/images.dart';
import '../Constants/colors.dart';
import '../Constants/textstyle.dart';
import '../widgetss/container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: homeAppbar,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20, top: 10),
              child: CircleAvatar(
                backgroundImage: circleAvatarImg,
              ),
            )
          ],
          elevation: 0,
        ),
        backgroundColor: pinkColor,
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text("DashBoard", style: dashboardTextStyle),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Last update 10 Oct 2022",
                      style: dashboardBottomText),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                // height: 600.h,
                decoration: const BoxDecoration(
                    color: blackColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ContainerW(
                                height: 125.h,
                                width: 140.w,
                                icon: dashBoardPersonIcon,
                                text: 'My Account',
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Expanded(
                              child: ContainerW(
                                height: 125.h,
                                width: 145.w,
                                icon: const Icon(Icons.supervised_user_circle),
                                text: 'Services',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ContainerW(
                                height: 125.h,
                                width: 145.w,
                                icon: dashBoardAboutIcon,
                                text: 'About us',
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Expanded(
                              child: ContainerW(
                                height: 125.h,
                                width: 145.w,
                                icon: dashBoardSearchIcon,
                                text: 'Search',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ContainerW(
                                height: 125.h,
                                width: 145.w,
                                icon: dashBoardRequestIcon,
                                text: 'Request',
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Expanded(
                              child: ContainerW(
                                height: 125.h,
                                width: 145.w,
                                icon: dashBoardContactIcon,
                                text: 'Contact us',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
