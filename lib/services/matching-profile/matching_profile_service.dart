// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';
import 'package:founder_app/model/matching-profile/matching_profiles_model.dart';

class MatchingProfilesService {
  var dio = Dio();
  Future<List<MatchingProfile>?> getAllMatchingProfileService(
      String token) async {
    String path = ApiConfig().baseUrl + ApiConfig().getmatchingprofileapi;
    try {
      Response response = await dio.get(path,
          options: Options(
            followRedirects: false,
            headers: {
              'Authorization': 'Bearer $token',
            },
            validateStatus: (status) {
              return status! < 599;
            },
          ));
      if (response.statusCode == 200) {
        log(response.data.toString());
        List<dynamic> data = response.data['matchingProfiles'];
        final res = data.map((e) => MatchingProfile.fromJson(e)).toList();

        return res;
      } else {
        // SnackbarPopUps.popUpB("Data Note Found", context);
      }
    } catch (e) {
      log("error from mathcing");
    }
    log("null from matching profile");

    return null;
  }
}
