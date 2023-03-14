import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/model/sign-up/sign_up_request.dart';
import 'package:founder_app/services/otp-service/otp-service.dart';
import 'package:founder_app/services/sign-up-service/sign_up_service.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:provider/provider.dart';

class OtpProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //otp vreifying provider
  Future<void> verifyotpProvider(BuildContext context) async {
    final email = emailController.text;
    final username = usernameController.text;
    final password = passwordController.text;

    final userSignUp =
        SignupReqModel(userName: username, email: email, password: password);

    // log("model $signupUser");

    final otp = otpController.text;
    ApiServiceOTP().verifyOTP(otp).then((value) => {
          if (value == true)
            {
              SnackbarPopUps.popUpG("OTP Verified", context),
              ApiServiceSignUp().signUp(userSignUp, context).then(
                    (value) => {
                      if (value?.token != null)
                        {
                          storage.write(key: "token", value:jsonEncode( value!.token)),
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                              (route) => false),
                          disposeTextfield(context)
                        }
                      else
                        {
                          SnackbarPopUps.popUpB(
                              "Something Went Wrong", context),
                        }
                    },
                  ),
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

  void disposeTextfield(context) {
    final provider = Provider.of<OtpProvider>(context, listen: false);
    provider.otpController.clear();
    provider.usernameController.clear();
    provider.emailController.clear();
    provider.passwordController.clear();
    provider.confirmPasswordController.clear();
  }
}
