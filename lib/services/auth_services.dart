// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, unused_local_variable, dead_code

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internshippractice/Modelss/loginModel.dart';
import 'package:internshippractice/screens/wlcm.dart';

class AuthServices {
  static Future Login(String name, String password) async {
    Dio dio = Dio();
    try {
      FormModel formModel = FormModel();
      var result;
      var body = {
        "usename": name,
        "password": password,
      };
      var response = await dio.get(
        "https://thewebconcept.com/fiverr/lotterysystem/api/login.php?type=logininfo&username=$name&password=$password",
      );
      if (response.data != null) {
        var result = jsonDecode(response.data.toString());
        print(response.data);
        if (result['isSuccess'].toString() == '0') {
          print("Something went wrong");
        }
      } else {
        return formModel = FormModel.fromJson(result);
        print(result.toString());
        Get.to(const WelcomeScreen());
      }
    } catch (e) {
      print(e);
    }
  }
}
