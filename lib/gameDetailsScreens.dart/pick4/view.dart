// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, non_constant_identifier_names, must_be_immutable, unused_import, unnecessary_this, prefer_collection_literals

import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internshippractice/Constants/colors.dart';
import 'package:internshippractice/gameDetailsScreens.dart/bor/repo.dart';
import '../../services/api_services/post_service.dart';
import '../../services/api_services/urls.dart';
import '../custom_widgets/custombutton.dart';
import 'logic.dart';

class Persons {
  int num, amount;
  String type, phone;
  Persons(this.num, this.amount, this.type, this.phone);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["Lottery Type"] = this.type;
    data["Number"] = this.num;
    data["Money"] = this.amount;

    return data;
  }
}

class Pick4Page extends StatelessWidget {
  final logic = Get.put(Pick4Logic());
  final state = Get.find<Pick4Logic>().state;

  List<Persons> PersonsLst = <Persons>[];

  var num_Controller = TextEditingController();

  var amount_Controller = TextEditingController();

  var phone_Controller = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey();

  String? number;
  String? amount;
  String? phone;

  String lotteryType = 'Pick4';

  validate() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();

      String number = num_Controller.text;
      String amount = amount_Controller.text;
      String phone = phone_Controller.text;
      String type = lotteryType;

      Persons p = Persons(int.parse(number), int.parse(amount), type, phone);
      PersonsLst.add(p);

      num_Controller.text = "";
      amount_Controller.text = "";
      phone_Controller.text = " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Pick4Logic>(builder: (pick4) {
      return Scaffold(
        backgroundColor: blackColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: pinkColor,
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back)),
          title: const Text('Lottery Types'),
          centerTitle: true,
          elevation: 0,
        ),

        ///----------------------Body------------\\
        body: SafeArea(
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: blackColor,
                  child: Column(
                    children: [
                      Container(
                        height: 50.h,
                        color: greyColor,

                        ///-----------------Types Row
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                                onTap: () {
                                  pick4.index = 1;
                                  lotteryType = 'Pick2';
                                  pick4.update();
                                },
                                child: Container(
                                    height: 50.h,
                                    width: 40.w,
                                    child: Center(
                                      child: Text(
                                        'Pick2',
                                        style: TextStyle(
                                            color: pick4.index == 1
                                                ? pinkColor
                                                : blackColor),
                                      ),
                                    ))),
                            SizedBox(
                              width: 50.w,
                            ),
                            InkWell(
                                onTap: () {
                                  pick4.index = 2;
                                  lotteryType = 'Pick3';
                                  pick4.update();
                                },
                                child: Container(
                                    height: 50.h,
                                    width: 40.w,
                                    child: Center(
                                      child: Text(
                                        'Pick3',
                                        style: TextStyle(
                                            color: pick4.index == 2
                                                ? pinkColor
                                                : blackColor),
                                      ),
                                    ))),
                            SizedBox(
                              width: 50.w,
                            ),
                            InkWell(
                                onTap: () {
                                  pick4.index = 0;
                                  lotteryType = 'Pick4';
                                  pick4.update();
                                },
                                child: Container(
                                    height: 50.h,
                                    width: 40.w,
                                    child: Center(
                                      child: Text(
                                        'Pick4',
                                        style: TextStyle(
                                            color: pick4.index == 0
                                                ? pinkColor
                                                : blackColor),
                                      ),
                                    ))),
                            SizedBox(
                              width: 40.w,
                            ),
                            InkWell(
                                onTap: () {
                                  pick4.index = 3;
                                  lotteryType = 'Marriage';
                                  pick4.update();
                                },
                                child: Container(
                                    height: 50.h,
                                    child: Center(
                                      child: Text(
                                        'Marriage',
                                        style: TextStyle(
                                            color: pick4.index == 3
                                                ? pinkColor
                                                : blackColor),
                                      ),
                                    ))),
                          ],
                        ),
                      ),

                      ///-----------Phone Field------------\\
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                        child: TextFormField(
                          cursorColor: pinkColor,
                          keyboardType: TextInputType.phone,
                          controller: phone_Controller,
                          style: const TextStyle(color: whiteColor),
                          decoration: InputDecoration(
                            hintText: "Phone",
                            prefixIcon: const Icon(
                              Icons.call,
                              color: greyColor,
                            ),
                            hintStyle: const TextStyle(color: greyColor),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: const BorderSide(color: greyColor)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide:
                                    const BorderSide(color: whiteColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: const BorderSide(color: pinkColor)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: const BorderSide(color: redColor)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),

                      pick4.index == 0
                          ? Row(
                              children: [
                                LineContainer(
                                  width: 30.w,
                                ),

                                ///----------------Number Field---------\\
                                SizedBox(
                                  width: 80.w,
                                  child: TextFormField(
                                    ///maxLength: 5,
                                    keyboardType: TextInputType.phone,
                                    cursorColor: pinkColor,
                                    controller: num_Controller,
                                    style: const TextStyle(color: whiteColor),
                                    decoration: InputDecoration(
                                      hintText: 'Number',
                                      hintStyle:
                                          const TextStyle(color: greyColor),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 8),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: greyColor)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: whiteColor)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: pinkColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: redColor)),
                                    ),

                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        Get.snackbar(
                                          'Enter numbers',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else if (value.length < 2) {
                                        Get.snackbar(
                                          'Number less than 2',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else if (value.length > 2) {
                                        Get.snackbar(
                                          'Number should be of 2 digits',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else {
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                LineContainer(
                                  width: 25.w,
                                ),

                                ///----------------Amount Field---------\\
                                SizedBox(
                                  width: 80.w,
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    cursorColor: pinkColor,
                                    controller: amount_Controller,
                                    //controller: bor.pick2moneycontroller,
                                    style: const TextStyle(color: whiteColor),
                                    decoration: InputDecoration(
                                      hintText: '\$\$',
                                      hintStyle:
                                          const TextStyle(color: greyColor),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 8),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: greyColor)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: whiteColor)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: pinkColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: redColor)),
                                    ),

                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        Get.snackbar(
                                          'Please enter amount',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else {
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                LineContainer(
                                  width: 50.w,
                                ),

                                ///----------------Add container---------\\
                                SizedBox(
                                  height: 55.h,
                                  width: 55.w,
                                  child: InkWell(
                                    onTap: () {
                                      ///  generalController.updateFormLoader(true);
                                      ///generalController.focusOut(context);
                                    },
                                    child: MaterialButton(
                                      color: pinkColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      onPressed: validate,
                                      child: const Icon(
                                        Icons.add,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                                LineContainer(
                                  width: 20.w,
                                )
                              ],
                            )
                          : SizedBox(
                              height: 0.h,
                            ),
                      pick4.index == 1
                          ? Row(
                              children: [
                                LineContainer(
                                  width: 20.w,
                                ),

                                ///----------------Number Field---------\\
                                SizedBox(
                                  width: 80.w,
                                  child: TextFormField(
                                    ///maxLength: 5,
                                    keyboardType: TextInputType.phone,
                                    cursorColor: pinkColor,
                                    controller: num_Controller,
                                    style: const TextStyle(color: whiteColor),
                                    decoration: InputDecoration(
                                      hintText: 'Number',
                                      hintStyle:
                                          const TextStyle(color: greyColor),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 8),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: greyColor)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: whiteColor)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: pinkColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: redColor)),
                                    ),

                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        Get.snackbar(
                                          'Enter numbers',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              whiteColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else if (value.length < 2) {
                                        Get.snackbar(
                                          'Number less than 2',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else if (value.length > 2) {
                                        Get.snackbar(
                                          'Number should be of 2 digits',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else {
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                LineContainer(
                                  width: 25.w,
                                ),

                                ///----------------Amount Field---------\\
                                SizedBox(
                                  width: 80.w,
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    cursorColor: pinkColor,
                                    controller: amount_Controller,
                                    //controller: bor.pick2moneycontroller,
                                    style: const TextStyle(color: whiteColor),
                                    decoration: InputDecoration(
                                      hintText: '\$\$',
                                      hintStyle:
                                          const TextStyle(color: greyColor),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 8),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: greyColor)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: whiteColor)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: pinkColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: redColor)),
                                    ),

                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        Get.snackbar(
                                          'Please enter amount',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else {
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                LineContainer(
                                  width: 50.w,
                                ),

                                ///----------------Add container---------\\
                                SizedBox(
                                  height: 55.h,
                                  width: 55.w,
                                  child: InkWell(
                                    onTap: () {
                                      ///  generalController.updateFormLoader(true);
                                      //generalController.focusOut(context);
                                    },
                                    child: MaterialButton(
                                      color: pinkColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      onPressed: validate,
                                      child: const Icon(
                                        Icons.add,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                                LineContainer(
                                  width: 20.w,
                                )
                              ],
                            )
                          : SizedBox(
                              height: 0.h,
                            ),
                      pick4.index == 2
                          ? Row(
                              children: [
                                LineContainer(
                                  width: 20.w,
                                ),

                                ///----------------Number Field---------\\
                                SizedBox(
                                  width: 80,
                                  child: TextFormField(
                                    ///maxLength: 5,
                                    keyboardType: TextInputType.phone,
                                    cursorColor: pinkColor,
                                    controller: num_Controller,
                                    style: const TextStyle(color: whiteColor),
                                    decoration: InputDecoration(
                                      hintText: 'Number',
                                      hintStyle:
                                          const TextStyle(color: greyColor),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 8),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: greyColor)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: whiteColor)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: pinkColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: redColor)),
                                    ),

                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        Get.snackbar(
                                          'Enter numbers',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else if (value.length < 2) {
                                        Get.snackbar(
                                          'Number less than 2',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else if (value.length > 2) {
                                        Get.snackbar(
                                          'Number should be of 2 digits',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else {
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                LineContainer(
                                  width: 25.w,
                                ),

                                ///----------------Amount Field---------\\
                                SizedBox(
                                  width: 80.w,
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    cursorColor: pinkColor,
                                    controller: amount_Controller,
                                    //controller: bor.pick2moneycontroller,
                                    style: const TextStyle(color: whiteColor),
                                    decoration: InputDecoration(
                                      hintText: '\$\$',
                                      hintStyle:
                                          const TextStyle(color: greyColor),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 8),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: greyColor)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: whiteColor)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: pinkColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: redColor)),
                                    ),

                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        Get.snackbar(
                                          'Please enter amount',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else {
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                LineContainer(
                                  width: 50.w,
                                ),

                                ///----------------Add container---------\\
                                SizedBox(
                                  height: 55.h,
                                  width: 55.w,
                                  child: InkWell(
                                    onTap: () {
                                      ///  generalController.updateFormLoader(true);
                                      ///generalController.focusOut(context);
                                    },
                                    child: MaterialButton(
                                      color: pinkColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      onPressed: validate,
                                      child: const Icon(
                                        Icons.add,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                                LineContainer(
                                  width: 20.w,
                                )
                              ],
                            )
                          : SizedBox(
                              height: 0.h,
                            ),
                      pick4.index == 3
                          ? Row(
                              children: [
                                LineContainer(
                                  width: 30.w,
                                ),

                                ///----------------Number Field---------\\
                                SizedBox(
                                  width: 80.w,
                                  child: TextFormField(
                                    ///maxLength: 5,
                                    keyboardType: TextInputType.phone,
                                    cursorColor: pinkColor,
                                    controller: num_Controller,
                                    style: const TextStyle(color: whiteColor),
                                    decoration: InputDecoration(
                                      hintText: 'Number',
                                      hintStyle:
                                          const TextStyle(color: greyColor),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 8),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: greyColor)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: whiteColor)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: pinkColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: redColor)),
                                    ),

                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        Get.snackbar(
                                          'Enter numbers',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else if (value.length < 2) {
                                        Get.snackbar(
                                          'Number less than 2',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else if (value.length > 2) {
                                        Get.snackbar(
                                          'Number should be of 2 digits',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else {
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                LineContainer(
                                  width: 25.w,
                                ),

                                ///----------------Amount Field---------\\
                                SizedBox(
                                  width: 80.w,
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    cursorColor: pinkColor,
                                    controller: amount_Controller,
                                    //controller: bor.pick2moneycontroller,
                                    style: const TextStyle(color: whiteColor),
                                    decoration: InputDecoration(
                                      hintText: '\$\$',
                                      hintStyle:
                                          const TextStyle(color: greyColor),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 8),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: greyColor)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: whiteColor)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: pinkColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                          borderSide: const BorderSide(
                                              color: redColor)),
                                    ),

                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        Get.snackbar(
                                          'Please enter amount',
                                          '',
                                          colorText: whiteColor,
                                          backgroundColor:
                                              pinkColor.withOpacity(.10),
                                          snackPosition: SnackPosition.TOP,
                                          margin: const EdgeInsets.all(15),
                                        );
                                      } else {
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                LineContainer(
                                  width: 50.w,
                                ),

                                ///----------------Add container---------\\
                                SizedBox(
                                  height: 55.h,
                                  width: 55.w,
                                  child: InkWell(
                                    onTap: () {
                                      ///  generalController.updateFormLoader(true);
                                      /// generalController.focusOut(context);
                                    },
                                    child: MaterialButton(
                                      color: pinkColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      onPressed: validate,
                                      child: const Icon(
                                        Icons.add,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                                LineContainer(
                                  width: 20.w,
                                )
                              ],
                            )
                          : SizedBox(
                              height: 0.h,
                            ),

                      SizedBox(
                        height: 30.h,
                      ),

                      ///----------------Tickets List------------\\
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Container(
                              width: 380.w,
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(color: greyColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        color: greyColor.withOpacity(.50),
                                        offset: const Offset(1, 1))
                                  ]),
                              child: Column(
                                children: [
                                  ///------------------Name Container-------------\\
                                  Container(
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      color: pinkColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.r),
                                          topRight: Radius.circular(15.r)),
                                      border: Border.all(color: greyColor),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Tickets',
                                      style: pick4.state.namestyle,
                                    )),
                                  ),
                                  SizedBox(height: 20.h),

                                  ///---------------------Data Tble---------------\\
                                  ///
                                  SizedBox(
                                    height: 250.h,
                                    width: 350.w,
                                    child: ListView(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: DataTable(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: pinkColor,
                                                )),

                                            columns: <DataColumn>[
                                              DataColumn(
                                                  label: Text(
                                                'Type',
                                                style: TextStyle(
                                                    color: blackColor,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Number',
                                                style: TextStyle(
                                                    color: blackColor,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Money',
                                                style: TextStyle(
                                                    color: blackColor,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ],
                                            //  Get.find<GeneralController>().updateFormLoader(false);
                                            rows: PersonsLst.map(
                                              (p) => DataRow(cells: [
                                                DataCell(
                                                  Text(
                                                    p.type.toString(),
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: blackColor),
                                                  ),
                                                ),
                                                DataCell(
                                                  Text(
                                                    p.num.toString(),
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: blackColor),
                                                  ),
                                                ),
                                                DataCell(
                                                  Text(
                                                    p.amount.toString(),
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: blackColor),
                                                  ),
                                                ),
                                              ]),
                                            ).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 20.h),

                                  //--------------Print Button---------------\\
                                  InkWell(
                                    onTap: () {
                                      postMethod(
                                          context,
                                          ticketsURL,
                                          {
                                            'data': PersonsLst.map(
                                                (e) => e.toJson()).toList()
                                          },
                                          false,
                                          ticketsRepo);
                                    },
                                    child: Container(
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        color: pinkColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15.r),
                                            bottomRight: Radius.circular(15.r)),
                                        border: Border.all(color: greyColor),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Print',
                                        style: pick4.state.namestyle,
                                      )),
                                    ),
                                  ),
                                ],
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
          ),
        ),
      );
    });
  }
}
