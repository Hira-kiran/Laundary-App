// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internshippractice/Constants/colors.dart';

class ContainerW extends StatelessWidget {
  String text;
  double height;
  double width;
  Icon icon;
  // Image img;
  ContainerW({
    super.key,
    this.text = "",
    this.height = 50,
    this.width = 50,
    // this.img = const Image(image: AssetImage("")),
    this.icon = const Icon(Icons.abc),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
          color: pinkColor, borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon.icon,
            size: 70,
            color: whiteColor,
          ),
          Text(
            text,
            style: TextStyle(
                color: whiteColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
