import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/controller/provider/connection-provider/connection_provider.dart';
import 'package:founder_app/controller/provider/matching-profile-provider/matching_profile_provider.dart';
import 'package:founder_app/controller/provider/notification-provider/notification_provider.dart';
import 'package:founder_app/controller/provider/profile-provider/profile_provider.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:founder_app/view/home/welcome_screen/welcomescreen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

class SplashscreenProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool? isExpired;
  // String? idUser;

  splashTimer(BuildContext context) async {
    String? checkLogin = await storage.read(key: "token");

    if (checkLogin != null) {
      isExpired = JwtDecoder.isExpired(checkLogin.toString());
      notifyListeners();
      log(isExpired.toString(), name: 'isExpired');
     

      // log(decodedtoken.toString());
      // notifyListeners();
      // log(nameUser.toString());
    }

    Timer(const Duration(seconds: 3), () {
      if (checkLogin == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      } else if (isExpired == true) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      } else if (isExpired == false) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        Provider.of<MatchingProfileProvider>(context, listen: false)
            .getAllMatchingProfile();
        Provider.of<ProfileProvider>(context, listen: false)
            .getUserDetailesProvider();
        Provider.of<NotificationProvider>(context, listen: false)
            .getallNotificationProvider(context);
        Provider.of<ConnectionProvider>(context, listen: false)
            .getallConnectionReq();
        Provider.of<ConnectionProvider>(context, listen: false)
            .getalltheConnections();
      }
    });
  }
}










  /* token checking  
        String token = response.data["token"];
          bool hasEx = JwtDecoder.isExpired(token);
          log(hasEx.toString());

          Map<String,dynamic> decodedtoken =JwtDecoder.decode(token);
          log(decodedtoken.toString());

          */