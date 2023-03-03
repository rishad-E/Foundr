import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';
import 'package:founder_app/utils/exceptions/exceptions.dart';

class UserProfileService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> getUserDetailes() async {
    String path = ApiConfig().baseUrl + ApiConfig().getUserDetailesapi;

    String? token = await storage.read(key: "token");

    try {
      Response response = await dio.get(path,options: Options(headers: {'Authorization':'Bearer $token'}));
      log(response.data);
      if (response.statusCode == 200) {
        log(response.data.toString());
      } else {
        log(response.data.toString());
      }
    } on DioException catch (e) {
      log(e.toString());
    }
  }
}
