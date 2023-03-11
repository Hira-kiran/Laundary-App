// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internshippractice/Constants/colors.dart';

import '../Constants/textstyle.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: pinkColor,
        centerTitle: true,
        title: const Text("IDEAL"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 35.h,
                    // width: 180.w,
                    child: Center(
                      child: Text("HISTORICAL", style: notificationHistorical),
                    ),
                    decoration: const BoxDecoration(color: whiteColor),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 35.h,
                    // width: 180.w,
                    child: Center(
                      child: Text("NOTIFICATION", style: notificationNotifi),
                    ),
                    decoration: const BoxDecoration(color: pinkColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
