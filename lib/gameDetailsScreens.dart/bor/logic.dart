import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'state.dart';

class BorLogic extends GetxController {
  final BorState state = BorState();
  int index = 0;

  TextEditingController phonecontroller = TextEditingController();
  TextEditingController pick2numbercontroller = TextEditingController();
  TextEditingController pick2moneycontroller = TextEditingController();

  TextEditingController pick3numbercontroller = TextEditingController();
  TextEditingController pick3moneycontroller = TextEditingController();

  TextEditingController pick4numbercontroller = TextEditingController();
  TextEditingController pick4moneycontroller = TextEditingController();

  TextEditingController marriagenumbercontroller = TextEditingController();
  TextEditingController marriagemoneycontroller = TextEditingController();
}
