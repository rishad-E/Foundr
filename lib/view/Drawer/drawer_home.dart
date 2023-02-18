import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/view/Drawer/messagiing/messaging.dart';
import 'package:founder_app/view/Events/event_sceen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
                    ontap1: () {},
                    icon1: Icons.account_circle_rounded,
                    text1: "My Profile",
                  ),
                  DrawerTile(
                    ontap1: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EventScreen()));
                    },
                    icon1: Icons.event,
                    text1: "Events",
                  ),
                  DrawerTile(
                    ontap1: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const MessagingScreen()));
                    },
                    icon1: Icons.chat_rounded,
                    text1: "Messages",
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
