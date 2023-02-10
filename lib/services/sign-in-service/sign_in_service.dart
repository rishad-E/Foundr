import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';
import 'package:founder_app/model/sign-in/sign_in_request.dart';
import 'package:founder_app/model/sign-in/sign_in_response.dart';
import 'package:founder_app/utils/exceptions/exceptions.dart';

class ApiServiceSignIn {
  var dio = Dio();

  //sign in service
  Future<SigninRespModel?>  signIn(SigninreqModel model, BuildContext context) async {
    String path = ApiConfig().baseUrl + ApiConfig().signInapi;
    try {
      Response response =
          await dio.post(path, data: jsonEncode(model.toJson()));
      log("message");
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final SigninRespModel signinmodel1 =
            SigninRespModel.fromJson(response.data);
        return signinmodel1;
      }
    } on DioError catch (e) {
      log(e.message.toString());
      DioException().dioError(e,context);
    }
    return null;
  }



} 
