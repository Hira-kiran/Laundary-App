// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internshippractice/Constants/colors.dart';

class CircleAvatarW extends StatelessWidget {
  String picktext;
  String numText;
  CircleAvatarW({super.key, required this.picktext, required this.numText});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: whiteColor,
      radius: 53.r,
      child: CircleAvatar(
        radius: 50.r,
        backgroundColor: pinkColor,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(picktext),
            const Divider(
              thickness: 2,
              indent: 12,
              endIndent: 12,
              color: whiteColor,
            ),
            Text(numText)
          ],
        ),
      ),
    );
  }
}
