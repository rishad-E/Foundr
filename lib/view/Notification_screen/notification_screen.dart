import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/view/Drawer/drawer_home.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';

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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Card(
                      color: backgroundColorConst,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const ListTile(
                        contentPadding: EdgeInsets.only(top: 10, bottom: 5),
                        // leading: Image(
                        //   height: 100,
                        //   fit: BoxFit.cover,
                        //   image: AssetImage("assets/images/img.png"),
                        // ),
                        leading: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color.fromARGB(255, 51, 125, 170),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                              // size:25,
                            ),
                          ),
                        ),
                        title: Text(
                          "Notification",
                          style: textStyle,
                        ),
                        subtitle: Text(
                          "notification description",
                          style: textStyle,
                        ),
                        trailing: Padding(
                          padding: EdgeInsets.only(right:10),
                          child: Text(
                            "9:23",
                            style: textStyle,
                          ),
                        ),
                      ),
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
