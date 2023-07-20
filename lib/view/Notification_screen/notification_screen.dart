import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/notification-provider/notification_provider.dart';
import 'package:founder_app/view/drawer/drawer_home.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const HomeDrawer(),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              child: const Text("Home", style: textStyle)),
          IconButton(
              onPressed: () {},
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
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.notifications_active,
                    color: iconcolor,
                  ),
                  wBox,
                  textNormalHeading("Notifications")
                ],
              ),
              hBox,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
                child: Consumer<NotificationProvider>(
                  builder: (context, value, child) {
                    if (value.notificationData == null || value.notificationData!.isEmpty) {
                      return  Center(
                        child: descriptionText('No Notification'),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.notificationData!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: backgroundColorConst,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.only(top: 10, bottom: 5),
                              
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 13),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: value
                                              .notificationData![index]
                                              .sender
                                              ?.profilePhoto !=
                                          null
                                      ? Image.network(
                                          value.notificationData![index].sender!
                                              .profilePhoto!,
                                        ).image
                                      : Image.asset(
                                          'assets/images/event-image.png',
                                        ).image,
                                ),
                              ),
                              title: Text(
                                value.notificationData![index].sender!
                                        .userName ??
                                    '',
                                style: textStyle,
                              ),
                              subtitle: Text(
                                value.notificationData![index].message ?? '',
                                style: textStyle,
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  dateChange(value
                                      .notificationData![index].createdAt
                                      .toString()),
                                  style: textStyle,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dateChange(String date) {
    DateTime dateTime = DateTime.parse(date);
    // String formatteddate = DateFormat('dd-MMMM-yyyy', 'en_US').format(dateTime);
    String time = DateFormat('h:mm a').format(dateTime);
    // formatteddate = formatteddate.toLowerCase();
    // String formattedDate = formatteddate.replaceFirst(
    //     formatteddate.substring(3, 4),
    //     formatteddate.substring(3, 4).toUpperCase());
    // String timeDate =  time;
    return time;
  }
}
