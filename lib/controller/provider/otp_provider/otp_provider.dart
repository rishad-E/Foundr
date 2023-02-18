// import 'package:flutter/material.dart';
// import 'package:founder_app/model/sign-up/sign_up_request.dart';
// import 'package:founder_app/services/OTP-service/otp-service.dart';
// import 'package:founder_app/services/sign-up-service/sign_up_service.dart';
// import 'package:founder_app/utils/error-popup/snackbar.dart';
// import 'package:founder_app/view/home/homescreen/homescreen.dart';

// class OtpProvider with ChangeNotifier {
//   TextEditingController otpController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   //otp vreifying provider
//   Future<void> verifyotpProvider(BuildContext context) async {
//     final otptext = otpController.text;
//     final emailtext = emailController.text;
//     final userNametext = usernameController.text;
//     final passwordtext = passwordController.text;
//     final signupUser = SignupReqModel(
//       email: emailtext,
//       password: passwordtext,
//       userName: userNametext,
//     );
//     ApiServiceOTP().verifyOTPService(otptext).then((value) => {
//           if (value == true)
//             {
//               SnackbarPopUps.popUpG("OTP verified", context),
//               ApiServiceSignUp().signUp(signupUser, context).then((value) => {
//                     if (value?.token != null)
//                       {
//                         Navigator.of(context).pushAndRemoveUntil(
//                             MaterialPageRoute(
//                               builder: (context) => const HomeScreen(),
//                             ),
//                             (route) => false)
//                       }
//                   })
//             }
//           else if (value == false)
//             {
//               SnackbarPopUps.popUpB("Incorrect OTP", context),
//             }
//           else
//             {
//               SnackbarPopUps.popUpB("Something went wrong", context),
//             }
//         });
//   }
// }
