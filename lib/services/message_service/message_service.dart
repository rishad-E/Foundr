import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';
import 'package:founder_app/model/messegemodel/get_message_model.dart';
import 'package:founder_app/model/messegemodel/send_message_model.dart';

class MessageService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<List<GetMessgRes>?> getMessageService(String selectedId) async {
    String? token = await storage.read(key: 'token');
    String path = ApiConfig().baseUrl + ApiConfig().messageApi;
    try {
      final option = Options(headers: {'Authorization': 'bearer $token'});
      Response response = await dio.get(
        path,
        queryParameters: {"to": selectedId},
        options: option,
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final result = data.map((e) => GetMessgRes.fromJson(e)).toList();
        return result;
      }
    } catch (e) {
      log(e.toString(), name: 'getmessageError');
    }
    return null;
  }

  Future<void> sendMessageService(SendMessageModel model) async {
    String? token = await storage.read(key: 'token');
    String path = ApiConfig().baseUrl + ApiConfig().messageApi;
    try {
      final option = Options(headers: {'Authorization': 'bearer $token'});
      Response response = await dio.post(
        path,
        data: jsonEncode(model.toJson()),
        options: option,
      );

      if (response.statusCode == 201) {
        log("message send",name: 'sendmessageSVC');
      }
    } catch (e) {
      log(e.toString(), name: 'sendmessageError');
    }
  }
}
