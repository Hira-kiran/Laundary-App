import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internshippractice/Constants/colors.dart';

class BorState {
  TextStyle? namestyle;
  TextStyle? profdetailsstyle;
  TextStyle? transdetailsstyle;

  BorState() {
    ///Initialize variables
    namestyle = TextStyle(
        color: blackColor, fontWeight: FontWeight.w800, fontSize: 18.sp);
    profdetailsstyle = TextStyle(
        color: blackColor, fontWeight: FontWeight.w600, fontSize: 15.sp);
    transdetailsstyle = TextStyle(
        color: blackColor, fontWeight: FontWeight.w300, fontSize: 13.sp);
  }
}
