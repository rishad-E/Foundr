import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:founder_app/view/home/welcome_screen/welcomescreen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SplashscreenProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool? isExpired;
  String? nameUser;


  splashTimer(BuildContext context) async {
    String? checkLogin = await storage.read(key: "token");

    if (checkLogin != null) {
      isExpired = JwtDecoder.isExpired(checkLogin.toString());
      notifyListeners();
      
    Map<String, dynamic> decodedtoken = JwtDecoder.decode(checkLogin.toString());
    log(decodedtoken.toString());
    nameUser = decodedtoken["userName"];
    notifyListeners();
    log(nameUser.toString());
    }
    log(isExpired.toString());
    // log(checkLogin.toString());

    // Map<String, dynamic> decoded = JwtDecoder.decode(checkLogin.toString());
    // log(decoded.toString());
    //  final nameUs =decoded["userName"];
    //  final emailus = decoded["email"];
    //  log(nameUs.toString());
    //  log(emailus.toString());



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