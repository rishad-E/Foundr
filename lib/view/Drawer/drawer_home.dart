// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/view/drawer/messagiing/messaging.dart';
import 'package:founder_app/view/events/event_sceen.dart';
import 'package:founder_app/view/profile/profile-screen.dart';
import 'package:founder_app/view/splash/splashscreen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return Drawer(
      backgroundColor: backgroundColorConst,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: Column(
                children: [
                  DrawerHeader(
                    // child: Image.asset('assets/images/founder-logo.png'),
                    child: Image.asset('assets/images/home-logo.png'),
                  ),
                  DrawerTile(
                    ontap1: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ));
                    },
                    icon1: Icons.account_circle_rounded,
                    text1: "My Profile",
                  ),
                  DrawerTile(
                    ontap1: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EventScreen()));
                    },
                    icon1: Icons.event,
                    text1: "Events",
                  ),
                  DrawerTile(
                    ontap1: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MessagingScreen()));
                    },
                    icon1: Icons.chat_rounded,
                    text1: "Messages",
                  ),
                  DrawerTile(
                    ontap1: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // backgroundColor:
                              // const Color.fromARGB(223, 43, 9, 53),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              title: const Text(
                                'SIGN OUT',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 105, 153, 189),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              content: const Text(
                                'Are You Sure Want To Sign Out',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 105, 153, 189),
                                    fontSize: 16),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () async {
                                          await storage.delete(key: "token");
                                          // await storage.deleteAll();
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SplashScreen()),
                                                  (route) => false);
                                        },
                                        child: const Text('Sign Out')),
                                    TextButton(
                                      onPressed: () {
                                        // Navigator.of(context).pop();
                                        log(storage.toString());
                                      },
                                      child: const Text('Cancel'),
                                    )
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    icon1: Icons.logout_outlined,
                    text1: "Sign Out",
                  ),
                ],
              ),
            ),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.32),
            // const Text(
            //   "V.1.0.0",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(color: Colors.grey),
            // ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String text1;
  final IconData icon1;
  final void Function() ontap1;
  const DrawerTile(
      {super.key,
      required this.ontap1,
      required this.icon1,
      required this.text1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white24,
        ),
        height: MediaQuery.of(context).size.height * 0.07,
        width: double.infinity,
        child: ListTile(
          iconColor: const Color.fromARGB(255, 105, 153, 189),
          textColor: const Color.fromARGB(255, 105, 153, 189),
          leading: Icon(icon1),
          title: Text(
            text1,
          ),
          onTap: ontap1,
        ),
      ),
    );
  }
}
