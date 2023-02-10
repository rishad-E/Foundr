
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:founder_app/view/Article/article_home.dart';
import 'package:founder_app/view/home/welcomescreen.dart';
import 'package:founder_app/view/sign_in_screen/sign_in_screen.dart';
import 'package:founder_app/view/sign_up_screen/sign_up_screen.dart';

//frst one =rgba(255, 50, 103, 137)    headings
//scnd one =rgba(255, 105, 153, 189)   light text
//third one =rgba(255,233,238,242)  normal bg
//fourth one =rgba(255,230,92,79)   red color

Widget appBarLogo(BuildContext context, size) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * size,
    child: const Image(
      image: AssetImage("assets/images/founder-logo.png"),
    ),
  );
}

Widget textHeading(text) {
  return Text(
    text,
    style: const TextStyle(
        color: Color.fromARGB(255, 50, 103, 137),
        fontSize: 24,
        fontWeight: FontWeight.w600),
  );
}

Widget textNormalHeading(text1) {
  return Text(
    text1,
    style: const TextStyle(
        color: Color.fromARGB(255, 50, 103, 137),
        fontSize: 18,
        fontWeight: FontWeight.w600),
  );
}

Widget descriptionText(text) {
  return Text(
    text,
    style: const TextStyle(
        color: Color.fromARGB(255, 105, 153, 189),
        fontSize: 16,
        fontWeight: FontWeight.w400),
  );
}

Widget signupBox(BuildContext context,{double? height1,double? width1}) {
  return Container(
    height: height1,
    width: width1,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 50, 103, 137),
      border: Border.all(color: const Color.fromARGB(255, 105, 153, 189)),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    child: TextButton(
      onPressed: () {
        log("sign up textbutton pressed");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SignUpScreen(),));
      },
      child: const Center(
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Widget signInBox(BuildContext context,{double? height1,double? width1}) {
  return Container(
    height: height1,
    width: width1,
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 105, 153, 189)),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    child: TextButton(
      onPressed: () {
        log("sign in textbutton pressed");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInScreen(),));
      },
      child: const Center(
        child: Text(
          "Sign In",
          style: TextStyle(color: Color.fromARGB(255, 50, 103, 137)),
        ),
      ),
    ),
  );
}

Widget homeImage(BuildContext context) {
  return Align(
    alignment: Alignment.centerRight,
    child: Image(
      image: const AssetImage("assets/images/home-logo.png"),
      height: MediaQuery.of(context).size.height * 0.25,
    ),
  );
}

Widget homeContainer({childwidget}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
    child: Container(
      padding: const EdgeInsets.all(15),
      height: 200,
      width: 300,
      decoration: const BoxDecoration(
        color: Colors.white60,
        // border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: childwidget
    ),
  );
}

Widget appBarHome(BuildContext context){
 return TextButton(onPressed: () {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const WelcomeScreen(),));
 }, child: const Text("Home "));
}

Widget appBarArticle(BuildContext context){
 return TextButton(onPressed: () {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const ArticleHome(),));
 }, child: const Text("Article "));
}