import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ProfileProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? nameUser ;
  
  Future<void> getProfile()async {
    String? token = await storage.read(key: "key");

    Map<String, dynamic> decodedtoken = JwtDecoder.decode(token!);
    log(decodedtoken.toString());
     nameUser = decodedtoken["userName"].toString();
     notifyListeners();

    // log(nameUser);
  }
}


 // Map<String, dynamic> decoded = JwtDecoder.decode(checkLogin.toString());
    // log(decoded.toString());
    //  final nameUs =decoded["userName"];
    //  final emailus = decoded["email"];
    //  log(nameUs.toString());
    //  log(emailus.toString());