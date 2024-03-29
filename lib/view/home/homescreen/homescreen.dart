import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/shimmereffectprofile.dart';
import 'package:founder_app/common/widgets/widget_event.dart';
import 'package:founder_app/common/widgets/widgethomescreen.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/connection-provider/connection_provider.dart';
import 'package:founder_app/controller/provider/matching-profile-provider/matching_profile_provider.dart';
import 'package:founder_app/model/event/event_model.dart';
import 'package:founder_app/services/event/event_service.dart';
import 'package:founder_app/view/article/articlehome/article_home.dart';
import 'package:founder_app/view/drawer/drawer_home.dart';
import 'package:founder_app/view/events/event_sceen.dart';
import 'package:founder_app/view/notification_screen/notification_screen.dart';
import 'package:founder_app/view/profile-matching_profile/profile_matching.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConnectionProvider>(context, listen: false);
    // List<String> ha = ['Not added'];
    return Scaffold(
      endDrawer: const HomeDrawer(),
      backgroundColor: backgroundColorConst,
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
                    builder: (context) => const ArticleHome()));
              },
              child: const Text("Articles", style: textStyle)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
              },
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
        padding: const EdgeInsets.fromLTRB(15, 0, 5, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              hBox,
              textHeading("Connecting Better."),
              hBox,
              descriptionText(
                  "Connect with co-founders based on your preferences  for interests, skills, location, and more, and start building your company."),
              homeImage(context),
              SizedBox(
                // color: const Color.fromARGB(255, 233, 238, 242),
                height: MediaQuery.of(context).size.height * 0.3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      homeContainer(
                        context,
                        color: Colors.white,
                        childwidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                              image:
                                  AssetImage("assets/images/star-verified.png"),
                              height: 30,
                            ),
                            hBox,
                            textNormalHeading("Thousands of co-founders await"),
                            hBox,
                            descriptionText(
                                "Join the largest co-founder matching platform to find the strongest candidate that's right for you")
                          ],
                        ),
                      ),
                      wBox,
                      homeContainer(
                        context,
                        color: Colors.white,
                        childwidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                              image:
                                  AssetImage("assets/images/expert-icon.png"),
                              height: 30,
                            ),
                            hBox,
                            textNormalHeading("Learn from Experts"),
                            hBox,
                            descriptionText(
                                "Learn from experts who have succeed in their industries and doing business.")
                          ],
                        ),
                      ),
                      wBox,
                      homeContainer(
                        context,
                        color: Colors.white,
                        childwidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                              image:
                                  AssetImage("assets/images/global-icon.png"),
                              height: 30,
                            ),
                            hBox,
                            textNormalHeading("Participate in events"),
                            hBox,
                            descriptionText(
                              "Participate in events that are conducting by leading industrial experts though online or offline. ",
                            ),
                          ],
                        ),
                      ),
                      wBox
                    ],
                  ),
                ),
              ),
              hBox,
              Align(
                alignment: Alignment.centerLeft,
                child: textNormalHeading("Matching Profiles"),
              ),
              hBox,
              SizedBox(
                // color: Colors.green,
                height: MediaQuery.of(context).size.height * 0.24,
                child: Consumer<MatchingProfileProvider>(
                  builder: (context, value, child) {
                    if (value.matchingProfileDatas == null) {
                      return const Center(child: ShimmerEffectProfile());
                    } else if (value.matchingProfileDatas!.isEmpty) {
                      return const Center(
                        child: Text(
                          "No Matched Profiles",
                          style: textStyle,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var data = value.matchingProfileDatas![index];
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Card(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  value.matchingProfileDatas![index]
                                              .profilePhoto !=
                                          null
                                      ? CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.transparent,
                                          child: ClipOval(
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  'assets/images/event-image.png',
                                              image: value
                                                  .matchingProfileDatas![index]
                                                  .profilePhoto!,
                                              width: 160,
                                              height: 160,
                                              fit: BoxFit.cover,
                                              fadeInDuration: const Duration(
                                                  milliseconds: 500),
                                            ),
                                          ),
                                        )
                                      : const CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              "assets/images/event-image.png"),
                                        ),
                                  Text(value
                                      .matchingProfileDatas![index].userName
                                      .toString()),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 105, 153, 189)),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                      ),
                                    ),
                                    onPressed: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (builder) {
                                            return ProfileMatched(
                                              profileImage:
                                                  data.profilePhoto ?? 'null',
                                              profileId: data.id!,
                                              userName: data.userName!,
                                              location: data.location == null
                                                  ? data.email!
                                                  : '${data.location!.country!},${data.location!.city!}',
                                              email: data.email ?? data.email!,
                                              about:
                                                  data.userName ?? data.email!,
                                              accomplishment:
                                                  data.accomplishments == null
                                                      ? 'Not added'
                                                      : data.accomplishments!,
                                              education: data.education == null
                                                  ? 'Not added'
                                                  : data.education!,
                                              technical: data.isTechnical == 1
                                                  ? 'Yes'
                                                  : 'no',
                                              idea: data.haveIdea == null
                                                  ? 'Not added'
                                                  : data.haveIdea ==
                                                          'definiteIdea'
                                                      ? 'Yes'
                                                      : data.haveIdea ==
                                                              'readyToExplore'
                                                          ? 'No'
                                                          : 'don\'t have any idea',
                                              interests: data.interests!,
                                              responsibilities:
                                                  data.responsibilities!,
                                            );
                                          },
                                        ),
                                      );
                                      await provider.buttonFuction(data.id!);
                                      await provider.getallConnectionReq();
                                    },
                                    child: const Text(
                                      'Show profile',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(
                                              255, 231, 231, 231)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: value.matchingProfileDatas!.length,
                      );
                    }
                  },
                ),
              ),
              hBox,
              Center(child: textNormalHeading("GAME-CHANGING ADVICE FROM")),
              Center(
                  child: textNormalHeading("FOUNDERS WHO HAVE MADE MILLIONS")),
              hBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FutureBuilder<List<Event>?>(
                    future: EventService().getEventService(context),
                    builder: ((context, snapshot) {
                      if (!snapshot.hasData|| snapshot.data!.isEmpty) {
                       return Center(
                          child: textNormalHeading("No Events"),
                        );
                        // return textHeading('text');
                      } else {
                        {
                          return GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const EventScreen())),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                EventCard(
                                    mentorName: snapshot.data![0].mentorName!,
                                    mentorImage:
                                        snapshot.data![0].mentorImage!),
                                wBox,
                                EventCard(
                                    mentorName: snapshot.data![1].mentorName!,
                                    mentorImage:
                                        snapshot.data![1].mentorImage!),
                              ],
                            ),
                          );
                        }
                      }
                    }),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EventScreen()));
                    },
                    child: const Text(
                      "Show All",
                      style: textStyle,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
