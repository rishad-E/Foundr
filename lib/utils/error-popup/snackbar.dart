import 'package:flutter/material.dart';

class SnackbarPopUps {
  static Future<void> popUp(String text, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style:const TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

        