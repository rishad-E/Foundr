import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgethomescreen.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';

class EventJoin extends StatelessWidget {
  const EventJoin({
    super.key,
    required this.title,
    required this.content,
    required this.mentorImage,
    required this.mentorName,
    required this.venue,
    required this.dateAndTime,
  });

  final String title;
  final String content;
  final String mentorImage;
  final String mentorName;
  final String venue;
  final String dateAndTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            // statusBarColor: Color.fromARGB(233,238,242,255),
            statusBarColor: Colors.white),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: appBarLogo(context, 0.3),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                    (route) => false);
              },
              child: const Text("Home ")),
          appBarArticleHome(context),
          wBox
        ],
      ),
      body: Center(
        child: Container(
          width: 350,
          // height: 700,
          decoration: BoxDecoration(
        color: backgroundColorConst,
        borderRadius:const BorderRadius.all(Radius.circular(10)),
      ),
          // color: Color.fromARGB(233, 168, 170, 177),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  hBox,
                  textHeading(title),
                  hBox,
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.25,
                    // color: Colors.grey,
                    child: Center(
                      child: Image.network(mentorImage, fit: BoxFit.cover),
                    ),
                  ),
                  hBox,
                  textNormalHeading(mentorName),
                  const Text(
                    "cheif guest",
                    style: textStyle,
                  ),
                  hBox,
                  hBox,
                  descriptionText(content),
                  hBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      descriptionText(venue),
                      wBox,
                      descriptionText(dateAndTime),
                    ],
                  ),
                  hBox,
                  Container(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 50, 103, 137),
                      border: Border.all(
                          color: const Color.fromARGB(255, 105, 153, 189)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Join The Event",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
