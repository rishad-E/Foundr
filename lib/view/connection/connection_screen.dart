import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/view/drawer/drawer_home.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:founder_app/view/notification_screen/notification_screen.dart';
import 'package:provider/provider.dart';

class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              child: const Text("Home", style: textStyle)),
          wBox
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [textNormalHeading("Connections")],
              ),
              hBox,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
                child: Consumer(
                  builder: (context, value, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                          color: backgroundColorConst,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.only(top: 10, bottom: 5),
                            // leading: Image(
                            //   height: 100,
                            //   fit: BoxFit.cover,
                            //   image: AssetImage("assets/images/img.png"),
                            // ),
                            leading: const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Color.fromARGB(255, 51, 125, 170),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  // size:25,
                                ),
                              ),
                              // CircleAvatar(
                              //     radius: 25,
                              //     backgroundColor: Colors.transparent,
                              //     backgroundImage: value
                              //                 .notificationData![index]
                              //                 .sender
                              //                 ?.profilePhoto !=
                              //             null
                              //         ? Image.network(
                              //             value.notificationData![index].sender!
                              //                 .profilePhoto!,
                              //           ).image
                              //         : Image.asset(
                              //             'assets/images/event-image.png',
                              //           ).image,
                              //   ),
                            ),
                            title: const Text(
                              "Rishad",
                              style: textStyle,
                            ),
                            subtitle: const Text(
                              "place",
                              style: textStyle,
                            ),
                            trailing: const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Text(
                                "view profile",
                                style: textStyle,
                              ),
                            ),
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => const MessagingUser(),
                              // ));
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
