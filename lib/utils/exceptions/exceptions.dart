import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';

class DioExceptionClass {
  var dio = Dio();

  void dioError(Object e, BuildContext context) {
    if (e is DioException ) {
      if (e.response?.statusCode == 404) {
        SnackbarPopUps.popUpB("Invalid Email", context);
      } else if (e.response?.statusCode == 401) {
        SnackbarPopUps.popUpB("Invalid Password", context);
      }
    }
  }
}
