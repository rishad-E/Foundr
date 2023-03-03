import 'package:flutter/material.dart';

//frst one =rgba(255, 50, 103, 137)    headings
//scnd one =rgba(255, 105, 153, 189)   light text
//third one =rgba(255,233,238,242)  normal bg
//fourth one =rgba(255,230,92,79)   red color

Color backgroundColorConst = const Color.fromARGB(233, 238, 242, 255);

const hBox = SizedBox(height: 20);
const hBoxS = SizedBox(height: 10);
Color kWhite = Colors.white60;

const wBox = SizedBox(width: 20);
const wBoxS = SizedBox(width: 10);
const textStyle = TextStyle(color: Color.fromARGB(255, 105, 153, 189));
const iconcolor =  Color.fromARGB(255, 50, 103, 137);

decorSignup(Color colr) {
  return BoxDecoration(
    color: colr,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );
}

InputDecoration decorTextfield([String? text1, IconButton? suffix]) {
  return InputDecoration(
    hintText: text1,
    hintStyle: textStyle,
    suffixIcon: suffix,
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromARGB(255, 105, 153, 189)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromARGB(255, 105, 153, 189)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromARGB(255, 105, 153, 189)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromARGB(255, 105, 153, 189)),
    ),
  );
}
