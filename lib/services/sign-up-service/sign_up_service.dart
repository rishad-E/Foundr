import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';
import 'package:founder_app/model/sign-up/sign_up_request.dart';
import 'package:founder_app/model/sign-up/sign_up_response.dart';
import 'package:founder_app/utils/exceptions/exceptions.dart';

class ApiServiceSignUp {
  var dio = Dio();

  Future<bool?> verifyUser(String email, BuildContext context) async {
    String path = ApiConfig().baseUrl + ApiConfig().verifyUserapi;
    try {
      Response response = await dio.get(path, queryParameters: {"email": email},
          options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ));
      log(email);
      if (response.statusCode == 400) {
        log(response.statusCode.toString());
        log(response.data.toString());

        return true;
      } else if (response.statusCode == 200) {
        log(response.data.toString());
        log("after response from verify user");
        return false;
      }
    } on DioError catch (e) {
      log(e.message);

      DioException().dioError(e, context);
    }
    return null;
  }

  Future<String?> generateOTP(BuildContext context) async {
    String path = ApiConfig().baseUrl + ApiConfig().generateOTPapi;

    try {
      Response response = await dio.get(path);
      if (response.statusCode == 201) {
        // log(response.statusCode.toString());
        log("response after generate otp");
        log(response.data.toString());
        return response.data.toString();
      } else {
        return response.data.toString();
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }

  Future<bool?> sendMail(
      String email, BuildContext context, String code, String userName) async {
    String path = ApiConfig().baseUrl + ApiConfig().sendMailapi;
    try {
      Response response = await dio.post(
        path,
        data: {
          "email": email,
          "content": code,
          "userName": userName,
          "subject": "Email verification"
        },
      );
      log("response from sendmail");
      log(response.data.toString());
      log(response.statusCode.toString());

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }

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

  Future<SignupRespModel?> signUp(SignupReqModel model, BuildContext context) async {
    String path = ApiConfig().baseUrl + ApiConfig().signUpapi;

    try {
      Response response =
          await dio.post(path, data: jsonEncode(model.toJson()),options: Options(validateStatus: (status) {
            return status! < 599 ;
          },));
      log("after response from sign up");
      if (response.statusCode == 201) {
        log(response.data.toString());
        final SignupRespModel signupmodel =
            SignupRespModel.fromJson(response.data);
        return signupmodel;
      }
    } on DioError catch (e) {
      log(e.message);
      log("error part in sign up");
      DioException().dioError(e, context);
    }
    return null;
  }
}
