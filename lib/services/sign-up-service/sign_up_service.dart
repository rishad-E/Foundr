import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';
import 'package:founder_app/model/sign-up/sign_up_request.dart';
import 'package:founder_app/model/sign-up/sign_up_response.dart';
import 'package:founder_app/utils/exceptions/exceptions.dart';

class ApiServiceSignUp {
  var dio = Dio();

//   Future<SignupRespModel?> verifyUser(SignupReqModel email, BuildContext context) async {
//     try {
//       Response response = await dio.get(ApiConfig().baseUrl + ApiConfig().verifyUserapi ,queryParameters: {"email":email} );
//       if (response.statusCode == 400) {
//         log("email already exists");
//         log(response.statusCode.toString());
//         // return response.data.toString();
//         // return response.data;
//         final SignupRespModel signupmodel1 = SignupRespModel.fromJson(response.data);
//         return signupmodel1;
//       }
//     } on DioError catch (e) {
//       log(e.message.toString());
//       DioException().dioError(e, context);
//     }
//     return null;
//   }

// }







  Future<String?> verifyUser(String email, BuildContext context) async {
    log("entering verifyuser service");
    log(email);
    try {
      Response response = await dio.get(
          ApiConfig().baseUrl + ApiConfig().verifyUserapi, queryParameters: {"email": email},options:Options(validateStatus: (status) {
            return status! < 500;
            
          },)
          );
          log(email);
      log(response.statusCode.toString());
      if (response.statusCode == 400) {
        log(response.data.toString());
        return response.data["message"];
      }
       else if (response.statusCode == 200) {
        log(response.data.toString());
        // return response.data["message"];
        
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}














  // Future<bool?> verifyUser(String email, BuildContext context) async {
  //   log("entering to verifyuser service");
 
  //   try {
  //     Response response = await dio.get( ApiConfig().baseUrl + ApiConfig().verifyUserapi,
  //      queryParameters: {"email":email});
  //   log("message");

  //     if (response.statusCode == 200 || response.statusCode==201) {
  //         // log("response after  get method of verify user");
  //       // log(response.data.toString());
  //       return  true;
  //     } 
  //     // else if (response.statusCode == 200) {
  //     //   return false;
  //     // }
  //   } on DioError catch (e) {
  //     log(e.message.toString());
  //     DioException().dioError(e, context);
  //   }
  //   return null;
  // }

  // Future<bool?> generateOTP(BuildContext context) async {
  //   String path = ApiConfig().baseUrl + ApiConfig().generateOTPapi;

  //   try {
  //     Response response = await dio.get(path);

  //     if (response.statusCode == 201) {
  //       log(response.statusCode.toString());
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } on DioError catch (e) {
  //     log(e.message.toString());
  //     DioException().dioError(e, context);
  //   }

  //   return null;
  // }