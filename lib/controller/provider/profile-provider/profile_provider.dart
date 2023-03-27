import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/model/profile/co_founder_update_model.dart';
import 'package:founder_app/model/profile/founder_profile_update_mode.dart';
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
  final TextEditingController accomplishController = TextEditingController();
  final TextEditingController educationContoller = TextEditingController();
  final TextEditingController employmentController = TextEditingController();

  /*-------selection question---------*/
  String? seeked;
  String? technical;
  String? hasIdea;
  String? location;
  int? founderTech;
  String? founderIdea;
  var questionitems = ['gender', 'Male', 'Female', 'Other'];
  String qSelected = 'gender';

  var question0items = ['select one', 'Yes', 'No'];
  String q0Selected = 'select one';

  var question1items = [
    'select one',
    'Technical',
    'Non-Technical',
    'No-preference',
  ];
  String q1Selected = 'select one';

  var question2items = [
    'select one',
    'I want to see co-founders who have a specific idea',
    'I want to see co-founders who are not set on a specific idea',
    'No-preferences',
  ];
  String q2Selected = 'select one';

  var question3items = [
    'select one',
    'Within a certain distance of me',
    'In My country',
    'No-preferences',
  ];
  String q3Selected = 'select one';

  var responsibilityItems = [
    'select one',
    'Product',
    'Engineering',
    'Design',
    'Sales and Marketing',
    'Operations'
  ];
  String? respo = 'select one';
  List<String>? responsibilitySelected = [];

  var question1Fitems = [
    'select one',
    'Yes',
    'No',
  ];
  String q1FSelected = 'select one';

  final question2Fitems = [
    'select one',
    'Yes, I am committed to an idea and i want a co-founder',
    'I have some ideas ,but iam open to explore other ideas',
    'No i could help a co-founder with their existing idea or explore new ideas together'
  ];
  String q2FSelected = 'select one';
  var responsFounderitems = [
    'select one',
    'Product',
    'Engineering',
    'Design',
    'Sales and Marketing',
    'Operations'
  ];

  String? respFounder = 'select one';
  List<String>? responsFounderSelected = [];
  var intresteditems = [
    'select one',
    'Agriculture / Agtech',
    'Artificial Intelligence',
    'Augmented Reality / Virtual Reality',
    'B2B / Enterprise',
    'Biomedical / Biotech',
    'Education / Edtech',
    'Entertainment',
    'Government',
    'Health / Wellness',
    'Travel / Tourism'
  ];
  String? intrestF = 'select one';
  List<String>? intrestedSelected = [];

  /*-------selection question---------*/

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
            if (value == true)
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

  /*-------------------to update co-foundr profile-------------------*/
  Future<void> updateCofounderProvider(BuildContext context) async {
    final cofounder = ReqCoFounderUpdateModel(
        activelySeeking: seeked,
        cofounderHasIdea: hasIdea,
        cofounderTechnical: technical,
        locationPreference: location,
        cofounderResponsibilities: responsibilitySelected);
    UserProfileService().updateCofounderService(cofounder).then((value) => {
          if (value == true)
            {
              SnackbarPopUps.popUpG("Co-founder preference updated", context),
            }
          else
            {SnackbarPopUps.popUpB("Something went wrong", context)}
        });
  }

  /*-------------------to update co-foundr profile-------------------*/
  Future<void> updateFounderProvider(BuildContext context)async {
    final accomplishment = accomplishController.text;
    final education = educationContoller.text;
    final employment = employmentController.text;
    final founder = ReqFounderUpdateModel(
        isTechnical: founderTech,
        haveIdea: founderIdea,
        accomplishments: accomplishment,
        education: education,
        employment: employment,
        responsibilities: responsFounderSelected,
        interests: intrestedSelected);
    UserProfileService().updateFounderService(founder).then((value) => {
          if (value == true)
            {
              SnackbarPopUps.popUpG("Profile preferences updated sucessfully", context),
            }
          else
            {
              SnackbarPopUps.popUpB("Something went wrong", context),
            }
        });
  }

  /*-------------validation about-------------*/
  String? aboutValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'field required';
    } else {
      return null;
    }
  }

  String? ageValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'age required';
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

  onchangeGeder(String val) {
    if (val == 'gender') {
      return 'gender not selected';
    } else {
      qSelected = val;
      notifyListeners();
    }
  }

  /*-------------validation co-founder-------------*/
  onchangeSeeking(String val) {
    if (val == 'select one') {
      return 'select field';
    } else {
      q0Selected = val;
      notifyListeners();
      if (q0Selected == 'Yes') {
        seeked = '1';
        // notifyListeners();
      } else if (q0Selected == 'No') {
        seeked = '0';
        // notifyListeners();
      }
    }
  }

  onchangeTechnical(String val) {
    if (val == 'select one') {
      return 'select filed';
    } else {
      q1Selected = val;
      notifyListeners();
      if (q1Selected == 'Technical') {
        technical = '1';
      } else if (q1Selected == 'Non-Technical') {
        technical = '2';
      } else if (q1Selected == 'No-preference') {
        technical = '3';
      }
    }
  }

  onchangeIdea(String val) {
    if (val == 'select one') {
      return 'select field';
    } else {
      q2Selected = val;
      notifyListeners();
      if (q2Selected == 'I want to see co-founders who have a specific idea') {
        hasIdea = '1';
      } else if (q2Selected ==
          'I want to see co-founders who are not set on a specific idea') {
        hasIdea = '2';
      } else if (q2Selected == 'No-preferences') {
        hasIdea = '3';
      }
    }
  }

  onchangeLocation(String val) {
    if (val == 'select one') {
      return 'select field';
    } else {
      q3Selected = val;
      notifyListeners();
      if (q3Selected == 'Within a certain distance of me') {
        location = '1';
      } else if (q3Selected == 'In My country') {
        location = '2';
      } else if (q3Selected == 'No-preferences') {
        location = '3';
      }
    }
  }

  onchangeResponsibility(String value) {
    if (value == 'select one' || value.isEmpty) {
      return 'select field';
    } else {
      if (responsibilitySelected!.contains(value)) {
        responsibilitySelected!.remove(value);
        notifyListeners();
      } else {
        responsibilitySelected!.add(value);
        notifyListeners();
      }
    }
  }

  /*-------------validation founder profile-------------*/
  fieldValidation(String val) {
    if (val.isEmpty || val.length < 5) {
      return 'Please fill this field';
    }
  }

  onchanngeFtechnical(String val) {
    if (val == 'select one') {
      return 'select field';
    } else {
      q1FSelected = val;
      notifyListeners();
      if (q1FSelected == 'Yes') {
        founderTech = 1;
      } else if (q1FSelected == 'No') {
        founderTech = 0;
      }
    }
  }

  onchangeFIdea(String val) {
    if (val == 'select one') {
      return 'select field';
    } else {
      q2FSelected = val;
      notifyListeners();
      if (q2FSelected ==
          'Yes, I am committed to an idea and i want a co-founder') {
        founderIdea = 'definiteIdea';
      } else if (q2FSelected ==
          'I have some ideas ,but iam open to explore other ideas') {
        founderIdea = 'readyToExplore';
      } else if (q2FSelected ==
          'No i could help a co-founder with their existing idea or explore new ideas together') {
        founderIdea = 'noIdea';
      }
    }
  }

  onchangeResponsFounder(String value) {
    if (value == 'select one' || value.isEmpty) {
      return 'select field';
    } else {
      if (responsFounderSelected!.contains(value)) {
        responsFounderSelected!.remove(value);
        notifyListeners();
      } else {
        responsFounderSelected!.add(value);
        notifyListeners();
      }
    }
  }

  onchangeInterest(String val) {
    if (val == 'select one') {
      return 'select field';
    } else {
      if (intrestedSelected!.contains(val)) {
        intrestedSelected!.remove(val);
        notifyListeners();
      } else {
        intrestedSelected!.add(val);
        notifyListeners();
      }
    }
  }
}










// String format = pickedFile.path.split('.').last == 'png' ? 'png' : 'jpeg';
