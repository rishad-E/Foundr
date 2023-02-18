import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';

class SecondWelcomeScreen extends StatelessWidget {
  const SecondWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorConst,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            // statusBarColor: Color.fromARGB(233,238,242,255),
            statusBarColor: Colors.white),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: appBarLogo(context, 0.3),
        actions: [appBarWelcome(context), appBarArticleWelcome(context), wBox],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            textHeading("How does it work?"),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textNormalHeading("First Step:"),
                descriptionText(
                    "Create a profile and tell us about yourself and your preferences for a co-founder."),
                hBox,
                textNormalHeading("Second Step:"),
                descriptionText(
                    "Once approved, we'll show you profiles that fit your preferences."),
                hBox,
                textNormalHeading("Third Step:"),
                descriptionText(
                    "If a profile piques your interest, send a personalized message to invite them to connect."),
                hBox,
                textNormalHeading("Last Step:"),
                descriptionText(
                    "If they accept your invite, that's a match! We recommend meeting ASAP and working together on a trial project.")
              ],
            ),
            signupBox(context, width1: 200),
          ],
        ),
      ),
    );
  }
}
