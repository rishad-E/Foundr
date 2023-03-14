import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/model/profile/profle_model.dart';
import 'package:founder_app/services/profile-service/profile_service.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  File? file;
  UserDetails? profileDatas;

  //to get all user details 
  Future<void> getUserDetailesProvider() async {
    UserProfileService().getUserDetailes().then((value) => {
          profileDatas = value,
        });
  }

  //to update profile
  Future pickImage(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;
    final tempImage = File(pickedFile.path);
    file = tempImage;
    String format = pickedFile.path.split('.').last == 'png' ? 'png' : 'jpeg';
    final base64file = base64Encode(file!.readAsBytesSync());
    String base64Image = 'data:image/$format;base64,$base64file';
    notifyListeners();

    // log(base64file, name: "base64");
    UserProfileService().profileUpdate(base64Image).then(
          (value) => {
            if (value = true)
              {
                SnackbarPopUps.popUpG("profile Upadated Sucessfully", context),
               getUserDetailesProvider()
              }
            else if (value == false)
              {SnackbarPopUps.popUpB("Invalid User", context)}
          },
        ); 
  }
}


// String format = pickedFile.path.split('.').last == 'png' ? 'png' : 'jpeg';