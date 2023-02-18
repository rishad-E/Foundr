import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:founder_app/model/sign-up/sign_up_request.dart';
// import 'package:founder_app/services/OTP-service/otp-service.dart';
import 'package:founder_app/services/sign-up-service/sign_up_service.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:founder_app/view/otpscreen/otpscreen.dart';

class SignupProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController otpController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  Future<void> verifyUserProvider(BuildContext context) async {
    final email = emailController.text;
    final userName = usernameController.text;
    // final password =
    await ApiServiceSignUp().verifyUser(email, context).then(
          (value) => {
            if (value == true)
              {
                // log(value.toString()),
                SnackbarPopUps.popUpB("Email Already Exists", context),
                log(value.toString())
              }
            else if (value == false)
              {
                SnackbarPopUps.popUpB("email verified", context),
                // log(value.toString()),
                ApiServiceSignUp().generateOTP(context).then((value1) => {
                      if (value1 != null)
                        {
                          ApiServiceSignUp()
                              .sendMail(email, context, value1, userName)
                              .then((value) => {
                                    if (value == true)
                                      {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => OtpScreen(),
                                        ),),
                                      }
                                  })
                        }
                      else
                        {
                          SnackbarPopUps.popUpB(
                              "Sometheing Went Wrong", context),
                        }
                    })
              }
          },
        );
  }

  //otp vreifying provider
  Future<void> verifyotpProvider(BuildContext context) async {
    final email = emailController.text;
    final userName = usernameController.text;
    final password = passwordController.text;
    final signupUser = SignupReqModel(
      email: email,
      userName: userName,
      password: password,
    );
    final otp = otpController.text;
    ApiServiceSignUp().verifyOTP(otp).then((value) => {
          if (value == true)
            {
              SnackbarPopUps.popUpG("OTP Verified", context),
              ApiServiceSignUp().signUp(signupUser, context).then((value) => {
                    if (value?.token != null)
                      {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) =>const HomeScreen(),
                            ),
                            (route) => false)
                      }
                    else
                      {
                        SnackbarPopUps.popUpB("Something Went Wrong", context),
                      }
                  })
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
}
