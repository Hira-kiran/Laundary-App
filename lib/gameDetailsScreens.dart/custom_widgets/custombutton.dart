import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internshippractice/Constants/colors.dart';

class LineContainer extends StatelessWidget {
  const LineContainer({Key? key, this.width}) : super(key: key);

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: width,
      decoration: BoxDecoration(
          color: pinkColor, borderRadius: BorderRadius.circular(0.r)),
    );
  }
}
