import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/model/sign-up/sign_up_request.dart';
import 'package:founder_app/services/otp-service/otp-service.dart';
import 'package:founder_app/services/sign-up-service/sign_up_service.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';

class OtpProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //otp vreifying provider
  Future<void> verifyotpProvider(BuildContext context) async {
    final emil = emailController.text.trim();
    final userName = usernameController.text;
    final password = passwordController.text.trim();

    final signupUser = SignupReqModel(
      userName: userName,
      email: emil,
      password: password,
    );
   
    log("model ${signupUser}");

    final otp = otpController.text;
    ApiServiceOTP().verifyOTP(otp).then((value) => {
          if (value == true)
            {
              SnackbarPopUps.popUpG("OTP Verified", context),
              ApiServiceSignUp().signUp(signupUser, context).then(
                    (value) => {
                      if (value?.token != null)
                        {
                          storage.write(key: "token", value: value!.token),
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                              (route) => false)
                        }
                      else
                        {
                          SnackbarPopUps.popUpB(
                              "Something Went Wrong", context),
                        }
                    },
                  ),
              disposeText()
            }
          else if (value == false)
            {
              SnackbarPopUps.popUpB("INCORRECT OTP", context),
            }
          else
            {
              SnackbarPopUps.popUpB("Something Went Wrong", context),
            }
        });
  }

  void disposeText() {
    otpController.clear();
  }
}
