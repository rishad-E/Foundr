import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/connection-provider/connection_provider.dart';
import 'package:provider/provider.dart';

class ProfileMatched extends StatelessWidget {
  const ProfileMatched({
    super.key,
    required this.id,
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
  final String id;
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
                            child: CircleAvatar(
                              foregroundImage:
                                  NetworkImage(profileImage),
                              backgroundColor: Colors.transparent,
                              radius: 60,
                            ),
                          ),
                        ],
                      ),
                      textHeading(userName),
                      descriptionText(email),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          color: Colors.transparent,
                          height: 45,
                          child: ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 50, 103, 137),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                ),
                              ),
                              onPressed: () {
                               Provider.of<ConnectionProvider>(context,listen: false).sendConnection(id, context);
                              },
                              icon: const Icon(Icons.person_add_alt_1),
                              label: const Text("connect")),
                        ),
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
                      descriptionText("description given as about"),
                      textNormalHeading("Impressive Accomplishment"),
                      descriptionText("description given as about"),
                      textNormalHeading("Education"),
                      descriptionText("description given as about"),
                      textNormalHeading("Is Technical"),
                      descriptionText("description given as about"),
                      textNormalHeading("Has Idea"),
                      descriptionText("description given as about"),
                      textNormalHeading("Interestes"),
                      descriptionText("description given as about"),
                      textNormalHeading("Responsibilities"),
                      descriptionText("description given as about"),
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