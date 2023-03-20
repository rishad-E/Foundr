import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/model/profile/profle_model.dart';
import 'package:founder_app/model/profile/updateaboutuser.dart';
import 'package:founder_app/services/profile-service/profile_service.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  File? file;
  UserDetails? profileDatas;

  final TextEditingController aboutController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  var questionitems = ['gender', 'Male', 'Female', 'Other'];
  String qSelected = 'gender';

  /*-------------------to get userdetails-------------------*/
  Future<void> getUserDetailesProvider() async {
    UserProfileService().getUserDetailes().then(
          (value) => {
            profileDatas = value,
            notifyListeners(),
          },
        );
  }

  /*-------------------to update profile-------------------*/
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

/*-------------------to update about user -------------------*/
  Future<void> updateAboutProvider(BuildContext context) async {
    final about = aboutController.text;
    final gender = qSelected;
    final age = ageController.text.trim();
    final country = countryController.text.trim();
    final state = stateController.text.trim();
    final city = cityController.text.trim();
    final aboutUser = UpdateUseraboutModel(
      intro: about,
      gender: gender,
      age: age,
      country: country,
      state: state,
      city: city,
    );
    UserProfileService().updateAboutService(aboutUser).then((value) => {
          if (value == true)
            {
              SnackbarPopUps.popUpG("Profile updated", context),
            }
        });
  }

  String? aboutValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else {
      return null;
    }
  }

  String? ageValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    int? ageCheck = int.tryParse(value);
    if (ageCheck == null) {
      return 'Please enter a valid age';
    } else if (ageCheck < 0 || ageCheck > 99) {
      return 'Please enter a valid age';
    } else {
      return null;
    }
  }

  onchange(String val) {
    qSelected = val;
    notifyListeners();
  }
}










// String format = pickedFile.path.split('.').last == 'png' ? 'png' : 'jpeg';
