import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';
import 'package:founder_app/model/notification/get_notification_model.dart';

class NotificationService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<List<NotificationElement>?> getallNotificationService() async {
    String path = ApiConfig().baseUrl + ApiConfig().getallNotificationapi;
    String? token = await storage.read(key: 'token');

    try {
      Response response = await dio.get(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) { 
      List<dynamic> data = response.data["notifications"];
        final res = data.map((e) => NotificationElement.fromJson(e)).toList();
        log(res.toString(),name: 'notification');
        return res;

      }
    } catch (e) {
      log(e.toString(),name: 'getNotifiError');
    }
    return null;
  }
}
