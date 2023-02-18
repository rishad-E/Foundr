import 'package:flutter/material.dart';
import 'package:founder_app/model/sign-in/sign_in_request.dart';
import 'package:founder_app/services/sign-in-service/sign_in_service.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';

class SigninProvider with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signinCheck(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text;
    final signinuser = SigninreqModel(email: email, password: password);

    await ApiServiceSignIn().signIn(signinuser, context).then(
          (value) => {
            if (value?.token != null)
              {
                
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false),
              }
          },
        );
    notifyListeners();
  }
}
