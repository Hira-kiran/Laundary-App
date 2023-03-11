// ignore_for_file: sort_child_properties_last, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internshippractice/Constants/colors.dart';
import 'package:internshippractice/screens/signup.dart';
import '../Constants/images.dart';
import 'login_screen.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 80,
                  ),
                  child: Text(
                    "Brand Name",
                    style: TextStyle(
                        color: pinkColor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CircleAvatar(
                      radius: 30.r,
                      backgroundImage: circleAvatarImg,
                    ))
              ],
            ),
          ),
          Divider(
            height: 60.h,
            indent: 40,
            endIndent: 40,
            color: dividerColor,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50, top: 90),
            child: Text(
              "Some text of\n your choice",
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: whiteColor),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Container(
              height: 60.h,
              width: 260.w,
              child: Center(
                  child: Text(
                "Login",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                  color: pinkColor, borderRadius: BorderRadius.circular(20)),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignUpScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 60.h,
                width: 260.w,
                child: const Center(
                    child: Text(
                  "Register",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                    color: pinkColor, borderRadius: BorderRadius.circular(20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
