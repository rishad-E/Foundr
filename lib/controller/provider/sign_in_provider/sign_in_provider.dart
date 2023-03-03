import 'package:flutter/material.dart';
import 'package:founder_app/model/sign-in/sign_in_request.dart';
import 'package:founder_app/services/sign-in-service/sign_in_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/view/splash/splashscreen.dart';

class SigninProvider with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> signinCheck(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final signinuser = SigninreqModel(email: email, password: password);

    await ApiServiceSignIn().signIn(signinuser, context).then(
          (value) => {
            if (value?.token != null)
              {
                storage.write(key: "token", value: value!.token),
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const SplashScreen()),
                    (route) => false),
                disposeTextfield()
              }
          },
        );
    isLoading = false;
    notifyListeners();
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

  void disposeTextfield() {
    emailController.clear();
    passwordController.clear();
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
}
