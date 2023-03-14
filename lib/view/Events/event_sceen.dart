// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/model/event/event_model.dart';
import 'package:founder_app/services/event/event_service.dart';
import 'package:founder_app/view/Drawer/drawer_home.dart';
import 'package:founder_app/view/events/event_join_screen.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:intl/intl.dart';

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
            SizedBox(
              // color: Colors.yellow,
              height: MediaQuery.of(context).size.height * 0.76,
              width: MediaQuery.of(context).size.width * 0.9,
              child: FutureBuilder<List<Event>?>(
                future: EventService().getEventService(context),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 5,
                        childAspectRatio: 5/6,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EventJoin(
                                  title: snapshot.data![index].title!,
                                  content: snapshot.data![index].description!,
                                  mentorImage:
                                      snapshot.data![index].mentorImage!,
                                  mentorName: snapshot.data![index].mentorName!,
                                  venue: snapshot.data![index].venue!,
                                  dateAndTime: dateChange(snapshot
                                      .data![index].dateAndTime
                                      .toString()),
                                  fee: snapshot.data![index].enrollmentFee!,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.24,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Card(
                              // color: Colors.yellow,
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 4, 46, 78),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Image(
                                      image: NetworkImage(
                                        snapshot.data![index].mentorImage!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  textNormalHeading(
                                      snapshot.data![index].mentorName),
                                  // Text(
                                  //   dateChange(snapshot.data![index].dateAndTime.toString()),
                                  //   style: const TextStyle(
                                  //       color: Color.fromARGB(255, 50, 103, 137),
                                  //       fontWeight: FontWeight.w600),
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Icon(
                                        Icons.bookmark,
                                        color:
                                            Color.fromARGB(255, 105, 153, 189),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  dateChange(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatteddate = DateFormat('dd-MMMM-yyyy', 'en_US').format(dateTime);
    String time = DateFormat('h:mm a').format(dateTime);
    formatteddate = formatteddate.toLowerCase();
    String formattedDate = formatteddate.replaceFirst(
        formatteddate.substring(3, 4),
        formatteddate.substring(3, 4).toUpperCase());
    String timeDate = formattedDate + " " + time;
    return timeDate;
  }
}
