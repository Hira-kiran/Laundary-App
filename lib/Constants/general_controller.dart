import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GeneralController extends GetxController {
  GetStorage boxStorage = GetStorage();

  focusOut(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  bool? formLoader = false;
  updateFormLoader(bool? newValue) {
    formLoader = newValue;
    update();
  }
}
