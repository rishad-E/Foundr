import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widget_event.dart';
import 'package:founder_app/common/widgets/widgethomescreen.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/view/Drawer/drawer_home.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            hBox,
            Container(child: textNormalHeading("GAME-CHANGING ADVICE FROM")),
            Center(child: textNormalHeading("FOUNDERS WHO HAVE MADE MILLIONS")),
            hBox,
            Container(
              // color: Colors.yellow,
              height: 650,
              width: 350,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 5,
                ),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: const Center(
                                child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/event-image.png"),
                              radius: 70,
                            )),
                            children: <Widget>[
                              SimpleDialogOption(
                                onPressed: () {},
                                child: const Text(
                                  'Should You Start A Startup?',
                                  style: TextStyle(),
                                ),
                              ),
                              SimpleDialogOption(
                                onPressed: () {},
                                child: const Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s,'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SimpleDialogOption(
                                    onPressed: () {},
                                    child: const Text("Anna Mary"),
                                  ),
                                  // SimpleDialogOption(
                                  //   onPressed: () {},
                                  //   child: const Text('Discord'),
                                  // ),
                                  SimpleDialogOption(
                                    onPressed: () {},
                                    child: const Text('1/03/2023,10:AM'),
                                  ),
                                ],
                              ),
                              SimpleDialogOption(
                                onPressed: () {},
                                child: const Text("Join Now...!!"),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 45,
                                    width: 150,
                                    child: TextFormField(
                                      decoration:
                                          decorTextfield("Enter your email"),
                                    ),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 105, 153, 189)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Get the link",
                                          style: textStyle,
                                        )),
                                  )
                                ],
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Card(
                        // color: Colors.yellow,
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 105, 153, 189),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Icon(
                                  Icons.bookmark,
                                  color: Color.fromARGB(255, 105, 153, 189),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}



















// AlertDialog(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20.0)),
//                           elevation: 30,
//                           backgroundColor:const Color.fromARGB(255, 105, 153, 189),
//                           title: const Text('Delete Playlist',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 22),
//                               textAlign: TextAlign.center),
//                           content: const Text(
//                             'Are Yout Sure You Want To Delete This Playlist',
//                           ),
//                           actions: [
//                             TextButton(
//                                 child: const Text(
//                                   'No',
//                                   style: TextStyle(fontSize: 16,color: Colors.white),
//                                 ),
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 }),
//                             TextButton(
//                               child: const Text(
//                                 'Yes',
//                                 style: textStyle,
//                               ),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                             )
//                           ],
//                         )