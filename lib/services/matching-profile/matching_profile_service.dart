// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';
import 'package:founder_app/model/matching-profile/matching_profiles_model.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';

class MatchingProfilesService {
  var dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<List<MatchingProfile>?> getAllMatchingProfile(
      BuildContext context) async {
    String path = ApiConfig().baseUrl + ApiConfig().getmatchingprofileapi;
    String? token = await storage.read(key: "token");
    log("this is the token : $token");
    // final option =Options(headers: {'Authorization':'Bearer {$token}'});

    try {
      dio.options.headers = {'Authorization': 'Bearer $token'};
    // dio.interceptors.add();
      Response response = await dio.get(
        path,
        options: Options(followRedirects: false),
      ); 
      log(response.headers.toString());
      if (response.statusCode == 200) {
        log(response.data.toString());
        List<dynamic> data = response.data['matchingProfiles'];
        final res = data.map((e) => MatchingProfile.fromJson(e)).toList();
        log(res.toString());
        return res;
      } else {
        SnackbarPopUps.popUpB("Data Note Found", context);    
      }
    } catch (e) {
      log(e.toString());
      log("error from mathcing");
    }
    log("null from matching profile");

    return null;
  }
}
