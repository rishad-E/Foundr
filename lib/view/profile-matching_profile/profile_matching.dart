import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/connection-provider/connection_provider.dart';
import 'package:provider/provider.dart';

class ProfileMatched extends StatelessWidget {
  const ProfileMatched({
    super.key,
    required this.profileId,
    required this.userName,
    required this.location,
    required this.email,
    required this.about,
    required this.accomplishment,
    required this.education,
    required this.technical,
    required this.idea,
    required this.interests,
    required this.responsibilities,
    required this.profileImage,
  });
  final String profileId;
  final String profileImage;
  final String userName;
  final String location;
  final String email;
  final String about;
  final String accomplishment;
  final String education;
  final String technical;
  final String idea;
  final List<dynamic> interests;
  final List<dynamic> responsibilities;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorConst,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        // title: appBarLogo(context, 0.3),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                hBoxS,
                Container(
                  // padding: const EdgeInsets.fromLTRB(0, 0, 2, 8),
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.36,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              // color: Colors.amberAccent,
                              image: DecorationImage(
                                image: AssetImage("assets/images/new.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 30,
                              child: profileImage == 'null'
                                  ? const CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 75,
                                      foregroundImage: AssetImage(
                                          'assets/images/event-image.png'),
                                    )
                                  : CircleAvatar(
                                      radius: 60,
                                      foregroundImage:
                                          NetworkImage(profileImage),
                                    )),
                        ],
                      ),
                      textHeading(userName),
                      descriptionText(email),
                      Consumer<ConnectionProvider>(
                        builder: (context, value, child) {
                          if (value.connectionCheck == 'No' ||
                              value.connectionCheck == null) {
                            return Align(
                              alignment: Alignment.topRight,
                              child: connectContainer(
                                height1: 45,
                                width1: 130,
                                text: 'connect',
                                icons: Icons.person_add_alt_sharp,
                                onpress: () async {
                                  value.sendConnection(profileId, context);
                                  await value.buttonFuction(profileId);
                                },
                              ),
                            );
                          } else {
                            return Align(
                              alignment: Alignment.topRight,
                              child: value.connectionCheck == 'true'
                                  ? connectContainer(
                                      height1: 45,
                                      width1: 130,
                                      text: 'requested',
                                      icons: Icons.person_add_alt_sharp,
                                      onpress: () {},
                                    )
                                  : value.connectionCheck == 'false'
                                      ? SizedBox(
                                          width: 180,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              acceptionContainer(
                                                height1: 40,
                                                width1: 80,
                                                text: "Accept",
                                                onpress: () {
                                                  value
                                                      .updateConnectionProvider(
                                                    "true",
                                                    profileId,
                                                    context,
                                                  );
                                                },
                                              ),
                                              acceptionContainer(
                                                height1: 40,
                                                width1: 80,
                                                text: "Reject",
                                                onpress: () {
                                                  value
                                                      .updateConnectionProvider(
                                                    "false",
                                                    profileId,
                                                    context,
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                        )
                                      : connectContainer(
                                          height1: 45,
                                          width1: 130,
                                          icons: Icons.chat_rounded,
                                          text: 'message',
                                          onpress: () {},
                                        ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
                hBoxS,
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                    // color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textNormalHeading("About"),
                      descriptionText(about),
                      textNormalHeading("Impressive Accomplishment"),
                      descriptionText("description given as about"),
                      textNormalHeading("Education"),
                      descriptionText("description given as about"),
                      textNormalHeading("Is Technical"),
                      descriptionText("description given as about"),
                      textNormalHeading("Has Idea"),
                      descriptionText("idea"),
                      textNormalHeading("Interestes"),
                      descriptionText("description given as about"),
                      textNormalHeading("Responsibilities"),
                      descriptionText(responsibilities.toString()),
                    ],
                  ),
                ),
                hBoxS
              ],
            ),
          ),
        ),
      ),
    );
  }
}
