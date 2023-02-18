// // ignore_for_file: file_names

// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:founder_app/common/constants/api/apiconfig.dart';
// import 'package:founder_app/utils/exceptions/exceptions.dart';

// class ApiServiceOTP {
//   Dio dio = Dio();

//   Future<String?> generateOTPService(BuildContext context) async {
//     String path = ApiConfig().baseUrl + ApiConfig().generateOTPapi;

//     try {
//       Response response = await dio.get(path);
//       if (response.statusCode == 201) {
//         log("response after generate otp");
//         log(response.data.toString());
//         return response.data.toString();
//       } else {
//         return response.data.toString();
//       }
//     } on DioError catch (e) {
//       log(e.message);
//       DioException().dioError(e, context);
//     }
//     return null;
//   }

//   Future<bool?> verifyOTPService(String code) async {
//     log(code);

//     String path = ApiConfig().baseUrl + ApiConfig().verifyOTPapi;
//     try {
//       Response response = await dio.post(path, queryParameters: {"code": code},
//           options: Options(
//         validateStatus: (status) {
//           return status! < 599;
//         },
//       ));
//       log("after response from verify otp");
//       if (response.statusCode == 200) {
//         log(response.data.toString());
//         log(response.statusCode.toString());
//         return true;
//       } else {
//         log(response.statusCode.toString());
//         log(response.data.toString());
//         return false;
//       }
//     } on DioError catch (e) {
//       log(e.message);
//     }
//     return null;
//   }
// }






//   // Future<String?> generateOTP(BuildContext context) async {
//   //   String path = ApiConfig().baseUrl + ApiConfig().generateOTPapi;

//   //   try {
//   //     Response response = await dio.get(path);
//   //     if (response.statusCode == 201) {
//   //       // log(response.statusCode.toString());
//   //       log("response after generate otp");
//   //       log(response.data.toString());
//   //       return response.data.toString();
//   //     } else {
//   //       return response.data.toString();
//   //     }
//   //   } on DioError catch (e) {
//   //     log(e.message);
//   //     DioException().dioError(e, context);
//   //   }
//   //   return null;
//   // }



// // Future<bool?> verifyOTP(String code) async {
//   //   log(code);
//   //   String path = ApiConfig().baseUrl + ApiConfig().verifyOTPapi;

//   //   try {
//   //     Response response = await dio.post(path, queryParameters: {"code": code},
//   //         options: Options(
//   //       validateStatus: (status) {
//   //         return status! < 599;
//   //       },
//   //     ));
//   //     log("after response from verify otp");

//   //     if (response.statusCode == 200) {
//   //       log(response.data.toString());
//   //       log(response.statusCode.toString());

//   //       return true;
//   //     } else {
//   //       log(response.statusCode.toString());
//   //       log(response.data.toString());
//   //       return false;
//   //     }
//   //   } on DioError catch (e) {
//   //     log(e.message);
//   //   }
//   //   return null;
//   // }