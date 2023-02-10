import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:founder_app/model/sign-up/sign_up_request.dart';
import 'package:founder_app/services/sign-up-service/sign_up_service.dart';

class SignupProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  Future<void> verifyUserProvider(BuildContext context) async {
    final email = emailController.text;
    // final email1 =SignupReqModel(email: email);

    await ApiServiceSignUp().verifyUser(email, context).then((value) => {
      log(value.toString()),
      log("enterd in to .then "),
      
    });
  }

  //
}

// final emailController = TextEditingController();
// Future<void> verifyUserProvider(BuildContext context) async {
//   final email = emailController.text;
//   log("entering verifyuserprovider");

//   await ApiServiceSignUp().verifyUser(email, context).then(
//         (value) => {
//           if (value == true)
//             {
//               SnackbarPopUps.popUp("Email Already Exists", context),
//             }
//           else if (value == false)
//             {
//               // SnackbarPopUps.popUp("Email Verified", context),
//               ApiServiceSignUp().generateOTP(context).then((value) => {
//                     if (value == true)
//                       {
//                         Navigator.of(context).pushAndRemoveUntil(
//                             MaterialPageRoute(
//                               builder: (context) => const OtpScreen(),
//                             ),
//                             (route) => false)
//                       }
//                     else
//                       {
//                         SnackbarPopUps.popUp(
//                             "Something Went Wrong with otp generation",
//                             context)
//                       }
//                   })
//             }
//           else
//             {
//               // SnackbarPopUps.popUp("Something Went Wrong in email verification", context),
//               log("value is neither true nor false it is null")
//             }
//         },
//       );
// }
