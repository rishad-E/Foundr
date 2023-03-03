// ignore_for_file: file_names
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';

class ApiServiceOTP {
  var dio = Dio();
 
  Future<bool?> verifyOTP(String code) async {
    log(code);
    String path = ApiConfig().baseUrl + ApiConfig().verifyOTPapi;

    try {
      Response response = await dio.post(path, queryParameters: {"code": code},
          options: Options(
        validateStatus: (status) {
          return status! < 599;
        },
      ));
      log("after response from verify otp");

      if (response.statusCode == 200) {
        log(response.data.toString());
        log(response.statusCode.toString());

        return true;
      } else {
        log(response.statusCode.toString());
        log(response.data.toString());
        return false;
      }
    } on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
