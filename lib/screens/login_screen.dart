// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internshippractice/Constants/colors.dart';
import 'package:internshippractice/Constants/controllers.dart';
import 'package:internshippractice/screens/signup.dart';
import 'package:internshippractice/services/auth_services.dart';
import 'package:internshippractice/widgetss/textFormField.dart';
import '../Constants/images.dart';
import '../Constants/textstyle.dart';
import '../widgetss/buttomNav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = false;
  final formkey = GlobalKey<FormState>();

  AuthServices authServices = AuthServices();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 270),
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundImage: circleAvatarImg,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Let's get started?",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextformFieldW(
                        controller: nameController,
                        hintText: "Email",
                        prefixIcon: const Icon(
                          Icons.email,
                          color: pinkColor,
                        ),
                      ),
                      TextformFieldW(
                        controller: passwordController,
                        obscure: hidePassword,
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            hidePassword = !hidePassword;
                            setState(() {});
                          },
                          icon: hidePassword
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: greyColor,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: pinkColor,
                                ),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: pinkColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 180, top: 5),
                child: Text(
                  "Forget Password?",
                  style: TextStyle(color: greyColor, fontSize: 18.sp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
                child: InkWell(
                  onTap: () {
                    loading = loading;
                    setState(() {
                      loading = true;
                    });

                    if (formkey.currentState!.validate()) {
                      loading = false;
                      AuthServices.Login(
                              nameController.text, passwordController.text)
                          .then((value) {
                        Get.to(() => const MyNav());
                      });
                    } else {
                      print("Failed");
                      loading = false;
                    }
                  },
                  child: Container(
                      height: 50.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                          color: pinkColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: loading
                              ? const CircularProgressIndicator(
                                  color: greyColor,
                                  strokeWidth: 5,
                                )
                              : Text("Login", style: loginTextStyle))),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 50),
            child: Row(
              children: [
                Text("Don't have an account?", style: loginsideText),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: Text(" Signup", style: signUpTextStyle),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}


// suffixIcon: IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   hidePassword = !hidePassword;
//                                 });
//                               },
//                               icon: Icon(
//                                 hidePassword
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                                 color: pinkColor.withOpacity(0.5),
//                               )),