import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';
import 'package:founder_app/model/sign-up/sign_up_request.dart';
import 'package:founder_app/model/sign-up/sign_up_response.dart';
import 'package:founder_app/utils/exceptions/exceptions.dart';

class ApiServiceSignUp {
  Dio dio = Dio();

  //verify the user ,if not registerd then generating otp
  Future<String?> verifyUserandGenerateService(
      String email, BuildContext context) async {
    String path = ApiConfig().baseUrl + ApiConfig().verifyandgenerate;

    try {
      Response response = await dio.get(path, queryParameters: {"email": email},
          options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ));

      if (response.statusCode == 400) {
        log(response.data.toString());
        return "Email Already Exists";
      } else if (response.statusCode == 201) {
        log(response.data.toString());
        return response.data.toString();
      }
    } on DioException catch (e) {
      log(e.toString());
      DioException().dioError(e, context);
    }
    return null;
  }

  // sending the otp to the given mail
  Future<bool?> sendMail(
      String email, BuildContext context, String code, String userName) async {
    String path = ApiConfig().baseUrl + ApiConfig().sendMailapi;

    try {
      Response response = await dio.post(
        path,
        data: {
          "email": email,
          "content": "OTP for your email verification is  $code",
          "userName": userName,
        },
      );
      log("response from sendmail");
      log(response.data.toString());
      log(response.statusCode.toString());

      if (response.statusCode == 201) {
        // true means message send sucessfully
        return true;
      } else {
        // false means message send failed
        return false;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }

  // gathering enterd data using model and sign up
  Future<SignupRespModel?> signUp(
      SignupReqModel reqModel, BuildContext context) async {
    String path = ApiConfig().baseUrl + ApiConfig().signUpapi;

    try {
      Response response = await dio.post(
        path,
        data: jsonEncode(reqModel.toJson()),
        options: Options(
          validateStatus: (status) {
            return status! < 599;
          },
        ),
      );
      log("after response from sign up");
      if (response.statusCode == 201) {
        log(response.statusCode.toString());
        log(response.data.toString());
        final SignupRespModel signupmodel =
            SignupRespModel.fromJson(response.data);
        return signupmodel;
      } else {
        log(response.data.toString());
        log(response.statusCode.toString());
      }
    } on DioError catch (e) {
      log(e.message);
      log("error part in sign up");
      DioException().dioError(e, context);
    }
    return null;
  }
}
