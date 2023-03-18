import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';

class EventJoinService {
  Dio dio = Dio();

  Future<bool?> joinEvent(String token, String id, String link) async {
    String path = ApiConfig().baseUrl + ApiConfig().joinEventapi;
    try {
      Response response = await dio.post(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: {"eventId": id, "joinLink": link},
      );

      log(response.data.toString(),name: 'joineventSVC');
      if (response.statusCode == 201) {
        // return response.data;
        return true;
      }else if(response.statusCode == 500){
        return false;
        // return "Something went wrong";
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
