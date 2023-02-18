import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgethomescreen.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/view/Article/articlehome/article_home.dart';
import 'package:founder_app/view/Drawer/drawer_home.dart';
import 'package:founder_app/view/Events/event_sceen.dart';
import 'package:founder_app/view/Notification_screen/notification_screen.dart';
import 'package:founder_app/view/home/welcome_screen/welcomescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const HomeDrawer(),
      backgroundColor: backgroundColorConst,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: appBarLogo(context, 0.3),
        actions: [
          TextButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const WelcomeScreen()));
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ArticleHome()));
              },
              child: const Text("Articles", style: textStyle)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
              },
              icon: const Icon(Icons.notifications_active,
                  color: Color.fromARGB(255, 105, 153, 189))),
          Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: const Icon(
                  Icons.account_circle_rounded,
                  color: Color.fromARGB(255, 105, 153, 189),
                )),
          ),
          wBox
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              hBox,
              textHeading("Connecting Better."),
              hBox,
              descriptionText(
                  "Connect with co-founders based on your preferences  for interests, skills, location, and more, and start building your company."),
              homeImage(context),
              SizedBox(
                // color: const Color.fromARGB(255, 233, 238, 242),
                height: MediaQuery.of(context).size.height * 0.3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      homeContainer(
                        context,
                        color: Colors.white,
                        childwidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                              image:
                                  AssetImage("assets/images/star-verified.png"),
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
                      wBox,
                      homeContainer(
                        context,
                        color: Colors.white,
                        childwidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                              image:
                                  AssetImage("assets/images/expert-icon.png"),
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
                      wBox,
                      homeContainer(
                        context,
                        color: Colors.white,
                        childwidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                              image:
                                  AssetImage("assets/images/global-icon.png"),
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
                      wBox
                    ],
                  ),
                ),
              ),
              hBox,
              Align(
                alignment: Alignment.centerLeft,
                child: textNormalHeading("Matching Profiles"),
              ),
              hBox,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: matchingProfile(context),
                    );
                  },
                  itemCount: 5,
                ),
              ),
              hBox,
              Center(child: textNormalHeading("GAME-CHANGING ADVICE FROM")),
              Center(
                  child: textNormalHeading("FOUNDERS WHO HAVE MADE MILLIONS")),
              hBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [eventCard(context), wBox, eventCard(context)],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EventScreen()));
                    },
                    child: const Text(
                      "Show All",
                      style: textStyle,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
