import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshippractice/Constants/colors.dart';

import '../../Constants/general_controller.dart';

ticketsRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<GeneralController>().updateFormLoader(false);
    // Get.find<GeneralController>()
    //     .boxStorage
    //     .write('userId', response['seller_id']);
    // log('user id is ----- ${Get.find<GeneralController>()
    //     .boxStorage
    //     .read('userId')}');
    //     Get.find<GeneralController>()
    //     .boxStorage
    //     .write('email', response['seller_email']);
    //     Get.find<GeneralController>()
    //     .boxStorage
    //     .write('phone', response['seller_contact']);
    //     Get.find<GeneralController>()
    //     .boxStorage
    //     .write('name', response['seller_name']);
    //      Get.offAll( Home_screenPage());
  } else if (!responseCheck) {
    Get.find<GeneralController>().updateFormLoader(false);
    Get.snackbar(
      'Try Again',
      '',
      colorText: pinkColor,
      backgroundColor: pinkColor.withOpacity(.40),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(15),
    );
    log('Exception........................');
  }
}
