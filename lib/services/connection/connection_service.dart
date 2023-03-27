import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';
import 'package:founder_app/model/connection/connectionreqmodel.dart';
import 'package:founder_app/model/connection/getconnectionresmodel.dart';

class ConnectionRequestService {
  Dio dio = Dio();
  /*------------send connection---------*/
  Future<bool?> sendConnectionService(
      ConnectionReqModel model, String token) async {
    String path = ApiConfig().baseUrl + ApiConfig().sendConnectionreqapi;

    try {
      Response response = await dio.post(path,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
          data: jsonEncode(model.toJson()));
      log(response.data.toString(), name: 'connection req');
      if (response.statusCode == 201) {
        return true;
      } else if (response.data != 201) {
        return false;
      }
    } catch (e) {
      log(e.toString(), name: 'connectionreqError');
    }
    return null;
  }

/*------------get all connection---------*/

  Future <List<ConnectionRequest>?> getConnetionService(String token) async {
    String path = ApiConfig().baseUrl + ApiConfig().getConnetionapi;
    try {
      Response response = await dio.get(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        List<dynamic> data= response.data['connectionRequests'];
        final result = data.map((e) => ConnectionRequest.fromJson(e)).toList();
        log(data.toString(),name: 'getConnection');
        return result;
        
      }
    } catch (e) {
      log(e.toString(),name: 'getconnectionError');
    }
    return null;
  }
}
