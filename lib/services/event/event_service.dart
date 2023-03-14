// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';
import 'package:founder_app/model/event/event_model.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';

class EventService {
  var dio = Dio();
  String path = ApiConfig().baseUrl + ApiConfig().getEventapi;

  Future<List<Event>?> getEventService(BuildContext context) async {
    
    try {
      Response response = await dio.get(path);

      if (response.statusCode == 200) {
        log(response.data.toString(),name: 'eventlog');
        List<dynamic> data = response.data['events'];
        final res = data.map((e) => Event.fromJson(e)).toList();
        return res;
      }else if(response.statusCode== 501){
        SnackbarPopUps.popUpB("Could not Retrieve data", context);
      }
    } catch (e) {
      log(e.toString());
    }
    log("null in getevent service");
    return null;
  }
}
