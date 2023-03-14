// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/profile-provider/profile_provider.dart';
import 'package:founder_app/view/Notification_screen/notification_screen.dart';
import 'package:founder_app/view/drawer/drawer_home.dart';
import 'package:founder_app/view/drawer/messagiing/messaging.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:founder_app/view/profile/co_foundr_profile.dart';
import 'package:founder_app/view/profile/foundr-profile.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const HomeDrawer(),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColorConst,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: appBarLogo(context, 0.3),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              child: const Text("Home", style: textStyle)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
              },
              icon: const Icon(Icons.notifications_active,
                  color: Color.fromARGB(255, 105, 153, 189))),
          wBox
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          hBox,
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.41,
              width: MediaQuery.of(context).size.width * 0.76,
              decoration: const BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Consumer<ProfileProvider>(
                builder: (context, value, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          value.pickImage(context);
                        },
                        child: value.profileDatas!.profilePhoto != null
                            ? CircleAvatar(
                                foregroundImage: NetworkImage(
                                    value.profileDatas!.profilePhoto!),
                                backgroundColor: Colors.transparent,
                                radius: 80,
                              )
                            : const CircleAvatar(
                                foregroundImage:
                                    AssetImage("assets/images/event-image.png"),
                                backgroundColor: Colors.transparent,
                                radius: 80,
                              ),
                      ),
                      textHeading(value.profileDatas!.userName),
                      descriptionText(value.profileDatas!.email),
                      // textNormalHeading("185 connections")
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 120,
                            color: Colors.transparent,
                            height: 45,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 50, 103, 137),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text("Connections")),
                          ),
                          Container(
                            width: 120,
                            color: Colors.transparent,
                            height: 45,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 50, 103, 137),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const MessagingScreen(),
                                  ));
                                },
                                child: const Text("Messaging")),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          hBox,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.23,
            width: MediaQuery.of(context).size.width * 0.76,
            // color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container( 
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const FounderProfile()));
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "set up your",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 105, 153, 189),
                            fontSize: 16),
                        children: <InlineSpan>[
                          const TextSpan(
                            text: " foundr",
                            style: TextStyle(
                                color: Color.fromARGB(255, 50, 103, 137),
                                fontSize: 18),
                          ),
                          TextSpan(
                            text: ".",
                            style:
                                TextStyle(color: Colors.red[600], fontSize: 28),
                          ),
                          const TextSpan(
                            text: "profile",
                            style: TextStyle(
                                color: Color.fromARGB(255, 105, 153, 189),
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CoFounderProfile()));
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "set up your",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 105, 153, 189),
                            fontSize: 16),
                        children: <InlineSpan>[
                          const TextSpan(
                            text: " co-foundr",
                            style: TextStyle(
                                color: Color.fromARGB(255, 50, 103, 137),
                                fontSize: 18),
                          ),
                          TextSpan(
                            text: ".",
                            style:
                                TextStyle(color: Colors.red[600], fontSize: 28),
                          ),
                          const TextSpan(
                            text: "profile",
                            style: TextStyle(
                                color: Color.fromARGB(255, 105, 153, 189),
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
