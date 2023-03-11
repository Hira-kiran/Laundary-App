// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, unused_local_variable
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internshippractice/Constants/colors.dart';
import 'package:internshippractice/Constants/controllers.dart';
import 'package:internshippractice/Constants/textstyle.dart';
import '../Constants/images.dart';
import '../screens/login_screen.dart';
import '../widgetss/buttomNav.dart';
import '../widgetss/textFormField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hiddePassword = true;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 50, left: 270),
        child: CircleAvatar(
          radius: 30.r,
          backgroundImage: circleAvatarImg,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
          "Join us now!",
          style: joinTopText,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextformFieldW(
                    controller: usernameController,
                    hintText: "User Name",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: pinkColor,
                    ),
                  ),
                  TextformFieldW(
                    controller: phoneController,
                    hintText: "Phone",
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: pinkColor,
                    ),
                  ),
                  TextformFieldW(
                    controller: emailController,
                    hintText: "Email",
                    prefixIcon: const Icon(
                      Icons.email,
                      color: pinkColor,
                    ),
                  ),
                  TextformFieldW(
                    controller: passwordController,
                    obscure: hiddePassword,
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: pinkColor,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          hiddePassword = !hiddePassword;
                          setState(() {});
                        },
                        icon: hiddePassword
                            ? const Icon(
                                Icons.visibility_off,
                                color: greyColor,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: pinkColor,
                              )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: InkWell(
          onTap: () async {
            await signUp().then((value) {
              Get.to(() => const MyNav());
            });
          },
          child: Container(
            height: 50.h,
            width: 350.w,
            decoration: BoxDecoration(
                color: pinkColor, borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                "Signup",
                style: signUpText,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 50),
        child: Row(
          children: [
            Text("Already have an account?", style: bottomText),
            InkWell(
              onTap: () {
                Get.to(() => const LoginScreen());
              },
              child: Text(" Login", style: loginText),
            )
          ],
        ),
      )
    ])));
  }

// *************Post APIs for Signup****************
  Future<dynamic> signUp() async {
    var url = "https://thewebconcept.com/fiverr/dee/api/buyCart.php";
    var data = {
      "username": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "phone": phoneController.text,
    };
    var bodyy = jsonEncode(data);
    http.Response response = await http.post(Uri.parse(url), body: bodyy);
    print(response);
    var dataa = jsonDecode(response.body);
    print(dataa);
  }
}
