import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/model/matching-profile/matching_profiles_model.dart';
import 'package:founder_app/services/matching-profile/matching_profile_service.dart';

class MatchingProfileProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  List<MatchingProfile>? matchingProfileDatas;
  Future<void> getAllMatchingProfile() async {
    String? token = await storage.read(key: 'token');
   
    await MatchingProfilesService().getAllMatchingProfileService(token.toString()).then(
      (value) {
        matchingProfileDatas = value;
      },
    );
  }
}
