import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/view/Article/arclewelcome/article_welcome.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:founder_app/view/home/welcome_screen/welcomescreen_workignbtn.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
        actions: [
          TextButton(onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const HomeScreen(),));
          }, child: const Text("Home ")),
          TextButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ArticleWelcome()));
          }, child: const Text("Articles ")),
          wBox
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hBox,
              // Center(child: textHeading("Connecting Better.")),
              textHeading("Connecting Better."),
              const SizedBox(height: 20),
              descriptionText(
                "Connect with co-founders based on your preferences  for interests, skills, location, and more, and start building your company.",
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  signupBox(height1: 50, width1: 100,context),
                  const SizedBox(width: 20),
                  signInBox(height1: 50, width1: 100,context)
                ],
              ),
              homeImage(context),
              welcomeContainer(
                color: Colors.white60,
                childwidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage("assets/images/star-verified.png"),
                      height: 30,
                    ),
                    hBox,
                    textNormalHeading("Thousands of co-founders await"),
                    hBox,
                    descriptionText(
                        "Join the largest co-founder matching platform to find the strongest candidate that's right for you")
                  ],
                ),
              ),
              hBox,
              welcomeContainer(
                 color: Colors.white60,
                childwidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage("assets/images/expert-icon.png"),
                      height: 30,
                    ),
                    hBox,
                    textNormalHeading("Learn from Experts"),
                    hBox,
                    descriptionText(
                        "Learn from experts who have succeed in their industries and doing business.")
                  ],
                ),
              ),
              hBox,
              welcomeContainer(
                 color: Colors.white60,
                childwidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage("assets/images/global-icon.png"),
                      height: 30,
                    ),
                    hBox,
                    textNormalHeading("Participate in events"),
                    hBox,
                    descriptionText(
                      "Participate in events that are conducting by leading industrial experts though online or offline. ",
                    ),
                  ],
                ),
              ),
              hBox,
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 238, 242),
                      border: Border.all(
                          color: const Color.fromARGB(255, 105, 153, 189)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  width: 200,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>const HomeScreen(),
                      ));
                    },
                    child: const Text("How does it work?"),
                  ),
                ),
              ),
              hBox
            ],
          ),
        ),
      ),
    );
  }
}
