import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pick4State {
  TextStyle? namestyle;
  TextStyle? profdetailsstyle;
  TextStyle? transdetailsstyle;
  Pick4State() {
    ///Initialize variables
    namestyle = TextStyle(
        color: Colors.black, fontWeight: FontWeight.w800, fontSize: 18.sp);
    profdetailsstyle = TextStyle(
        color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15.sp);
    transdetailsstyle = TextStyle(
        color: Colors.black, fontWeight: FontWeight.w300, fontSize: 13.sp);
  }
}
