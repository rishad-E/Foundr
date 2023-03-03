import 'package:flutter/material.dart';
import 'package:founder_app/controller/provider/otp_provider/otp_provider.dart';
import 'package:founder_app/services/sign-up-service/sign_up_service.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';
import 'package:founder_app/view/otpscreen/otpscreen.dart';
import 'package:provider/provider.dart';

class SignupProvider with ChangeNotifier {

  Future<void> verifyUserProvider(BuildContext context) async {
    final provider = Provider.of<OtpProvider>(context, listen: false);
    final email = provider.emailController.text;
    final userName = provider.usernameController.text;

    await ApiServiceSignUp().verifyUserandGenerateService(email, context).then(
          (value) => {
            if (value == "Email Already Exists")
              {SnackbarPopUps.popUpG("Email Already Exists", context)}
            else if (value != null)
              {
                ApiServiceSignUp()
                    .sendMail(email, context, value, userName)
                    .then(
                      (value) => {
                        if (value == true)
                          {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(),
                              ),
                            ),
                            disposeTextfield(context)
                          }
                        else
                          {
                            SnackbarPopUps.popUpB(
                                "Something Went Wrong", context)
                          }
                      },
                    )
              }
          },
        );
  }

  void disposeTextfield(context) {
    final provider = Provider.of<OtpProvider>(context, listen: false);

    provider.usernameController.clear();
    provider.emailController.clear();
    provider.passwordController.clear();
    provider.confirmPasswordController.clear();
  }

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else {
      return null;
    }
  }

  String? usernameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else if (value.length < 2) {
      return 'Too short username';
    } else {
      return null;
    }
  }

  String? emailValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email , please enter correct email';
    } else {
      return null;
    }
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value.length > 8) {
      return 'Password exceeds 8 character';
    }
    return null;
  }

  String? confirmpasswordValdation(String? value, context) {
    final provider = Provider.of<OtpProvider>(context, listen: false);
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value != provider.passwordController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    // color: kBlack,
  );

  void visibility() {
    if (obscureText == false) {
      icon = const Icon(
        Icons.visibility_off,
        // color: kBlack,
      );
      obscureText = true;
      notifyListeners();
    } else {
      icon = const Icon(
        Icons.visibility,
        // color: kBlack,
      );
      obscureText = false;
      notifyListeners();
    }
  }
}
