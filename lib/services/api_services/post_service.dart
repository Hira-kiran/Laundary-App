// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as dio_instance;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/general_controller.dart';
import 'header.dart';

postMethod(
    BuildContext context,
    String apiUrl,
    dynamic postData,
    bool addAuthHeader,
    Function executionMethod // for performing functionalities
    ) async {
  dio_instance.Response response;
  dio_instance.Dio dio = dio_instance.Dio();

  setAcceptHeader(dio);
  setContentHeader(dio);

  // -- if API need headers then this if works and it based on bool value come from function calling
  if (addAuthHeader &&
      Get.find<GeneralController>().boxStorage.hasData('authToken')) {
    setCustomHeader(dio, 'Authorization',
        'Bearer ${Get.find<GeneralController>().boxStorage.read('authToken')}');
  }

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      log('Internet Connected');
      try {
        log('postData--->> $postData');
        response = await dio.post(apiUrl, data: postData);

        if (response.statusCode == 200) {
          log('StatusCode------>> ${response.statusCode}');
          log('Response $apiUrl------>> ${response.data}');

          executionMethod(context, true, jsonDecode(response.data));
        } else {
          executionMethod(context, false, {'status': null});
          log('StatusCode------>> ${response.statusCode}');
          log('Response $apiUrl------>> $response');
        }
      } on dio_instance.DioError catch (e) {
        executionMethod(context, false, {'status': null});

        if (e.response != null) {
          log('Dio Error From Get $apiUrl -->> ${e.response}');
        } else {
          log('Dio Error From Get $apiUrl -->> $e');
        }
      }
    }
  } on SocketException catch (_) {
    Get.find<GeneralController>().updateFormLoader(false);
    log('Internet Not Connected');
  }
}
