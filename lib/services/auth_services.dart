// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, unused_local_variable, dead_code
import 'dart:convert';
import 'package:dio/dio.dart';

class AuthServices {
  static Future Login(String name, String password) async {
    Dio dio = Dio();
    try {
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
      } else if (result['isSuccess'].toString() == '0') {
        return print("Something went wrong");
      } else {
        print(("wrong"));
      }
    } catch (e) {
      print(e);
    }
  }
}
