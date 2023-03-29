// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/connection-provider/connection_provider.dart';
import 'package:founder_app/controller/provider/profile-provider/profile_provider.dart';
import 'package:founder_app/view/connection/connection_screen.dart';
import 'package:founder_app/view/messagiing/messaging.dart';
import 'package:founder_app/view/notification_screen/notification_screen.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:founder_app/view/profile-updation/co_foundr_profile.dart';
import 'package:founder_app/view/profile-updation/foundr-profile.dart';
import 'package:founder_app/view/splash/splashscreen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final GlobalKey<FormState> formkey = GlobalKey();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConnectionProvider>(context, listen: false);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            hBox,
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.36,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: const BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Consumer<ProfileProvider>(
                  builder: (context, value, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        // backgroundColor:
                                        // const Color.fromARGB(223, 43, 9, 53),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        title: const Text(
                                          'SIGN OUT',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 105, 153, 189),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        content: const Text(
                                          'Are You Sure Want To Sign Out',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 105, 153, 189),
                                              fontSize: 16),
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                  onPressed: () async {
                                                    await storage.delete(
                                                        key: "token");
                                                    // await storage.deleteAll();
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const SplashScreen()),
                                                            (route) => false);
                                                  },
                                                  child:
                                                      const Text('Sign Out')),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Cancel'),
                                              )
                                            ],
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.logout)),
                        ),
                        InkWell(
                            onTap: () {
                              value.pickImage(context);
                            },
                            child: value.profileDatas!.profilePhoto == null
                                ? const CircleAvatar(
                                    foregroundImage: AssetImage(
                                        "assets/images/event-image.png"),
                                    backgroundColor: Colors.transparent,
                                    radius: 75,
                                  )
                                : CircleAvatar(
                                    radius: 75,
                                    backgroundColor: Colors.transparent,
                                    child: ClipOval(
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/images/event-image.png',
                                        image:
                                            value.profileDatas!.profilePhoto!,
                                        width: 160,
                                        height: 160,
                                        fit: BoxFit.cover,
                                        fadeInDuration:
                                            const Duration(milliseconds: 500),
                                      ),
                                    ),
                                  )),
                        textNormalHeading(value.profileDatas == null
                            ? 'username'
                            : value.profileDatas!.userName),
                        descriptionText(value.profileDatas == null
                            ? 'email'
                            : value.profileDatas!.email),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 130,
                              color: Colors.transparent,
                              height: 40,
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
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const MessagingScreen(),
                                    ));
                                  },
                                  child: const Text("Messages")),
                            ),
                            Container(
                                width: 130,
                                color: Colors.transparent,
                                height: 40,
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
                                  onPressed: () async {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ConnectionScreen()),
                                    );
                                    await provider.getalltheConnections();
                                  },
                                  child: provider.listLength == 0
                                      ? const Text("connections")
                                      : Text(
                                          '${provider.listLength} connections'),
                                )),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            hBox,
            Container(
              padding: const EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: const BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Form(
                key: formkey,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Consumer<ProfileProvider>(
                  builder: (context, data, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        textNormalHeading("About You"),
                        TextFormField(
                          controller: data.aboutController,
                          decoration: textfocus(
                              data.profileDatas!.intro ?? 'about yourself'),
                          validator: (value) => data.aboutValidation(value),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: data.ageController,
                                validator: (value) => data.ageValidation(value),
                                decoration: textfocus(
                                    data.profileDatas!.age == null
                                        ? 'age'
                                        : data.profileDatas!.age.toString()),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                items: data.questionitems
                                    .map((String dropdownVal) {
                                  return DropdownMenuItem<String>(
                                    value: dropdownVal,
                                    child: Text(
                                      dropdownVal,
                                      style: textStyle,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  data.onchangeGeder(value!);
                                },
                                validator: (value) =>
                                    data.onchangeGeder(value!),
                                value:
                                    data.profileDatas!.gender ?? data.qSelected,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: TextFormField(
                                  controller: data.countryController,
                                  validator: (value) =>
                                      data.aboutValidation(value),
                                  decoration: textfocus(
                                      data.profileDatas!.location == null
                                          ? 'country'
                                          : data.profileDatas!.location!
                                              .country)),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: TextFormField(
                                controller: data.stateController,
                                validator: (value) =>
                                    data.aboutValidation(value),
                                decoration: textfocus(
                                    data.profileDatas!.location == null
                                        ? 'state'
                                        : data.profileDatas!.location!.state),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: TextFormField(
                                controller: data.cityController,
                                validator: (value) =>
                                    data.aboutValidation(value),
                                decoration: textfocus(
                                    data.profileDatas!.location == null
                                        ? 'city'
                                        : data.profileDatas!.location!.city),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            color: Colors.transparent,
                            height: 40,
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
                                  if (formkey.currentState!.validate()) {
                                    data.updateAboutProvider(context);
                                  }
                                },
                                child: const Text("save")),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              // color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textNormalHeading("setup your profiles"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 130,
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FounderProfile()));
                          },
                          child: Text.rich(
                            TextSpan(
                                text: "Foundr",
                                style: const TextStyle(fontSize: 18),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: ".",
                                    style: TextStyle(
                                        color: Colors.red[600], fontSize: 24),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 130,
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CoFounderProfile()));
                          },
                          child: Text.rich(
                            TextSpan(
                                text: "co-Foundr",
                                style: const TextStyle(fontSize: 18),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: ".",
                                    style: TextStyle(
                                        color: Colors.red[600], fontSize: 24),
                                  ),
                                ]),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
