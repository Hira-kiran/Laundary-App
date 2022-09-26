// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';

class AuthServices {
  Future<dynamic> Login(String? email, String? password) async {
    Dio dio = Dio();
    try {
      var result;
      var body = {
        "email": email,
        "password": password,
      };
      var response = await dio.post(
          "https://thewebconcept.com/fiverr/lotterysystem/api/login.php?type=logininfo&username=admin&password=1234&email=admin@gmail.com",
          data: body);
      print(response.data);
      result = jsonEncode(response.data);
      print("this is my result" + result);
      //print(result);
      return result;
    } catch (e) {
      print(e);
    }
  }
}
