// ignore_for_file: file_names
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/profile-provider/profile_provider.dart';
import 'package:founder_app/view/notification_screen/notification_screen.dart';
import 'package:founder_app/view/drawer/drawer_home.dart';
import 'package:founder_app/view/drawer/messagiing/messaging.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:founder_app/view/profile/co_foundr_profile.dart';
import 'package:founder_app/view/profile/foundr-profile.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

 
  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final providerWOL = Provider.of<ProfileProvider>(context);

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
                      InkWell(
                        onTap: () {
                          value.pickImage(context);
                        },
                        child: value.profileDatas!.profilePhoto != null
                            ? CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.transparent,
                                child: ClipOval(
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/images/event-image.png',
                                    image: value.profileDatas!.profilePhoto!,
                                    width: 160,
                                    height: 160,
                                    fit: BoxFit.cover,
                                    fadeInDuration:
                                        const Duration(milliseconds: 500),
                                  ),
                                ),
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
                                child: const Text("Messages")),
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
          Container(
            padding: const EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Form(
              key: formkey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  textNormalHeading("About You"),
                  TextFormField(
                    controller: providerWOL.aboutController,
                    decoration: textfocus('about yourself'),
                    validator: (value) => providerWOL.aboutValidation(value),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: providerWOL.ageController,
                            validator: (value) =>
                                providerWOL.ageValidation(value),
                            decoration: textfocus('age')),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          items: providerWOL.questionitems
                              .map((String dropdownVal) {
                            return DropdownMenuItem<String>(
                              value: dropdownVal,
                              child: Text(dropdownVal,style: textStyle,),
                            );
                          }).toList(),
                          onChanged: (value) {
                            providerWOL.onchange(value!);
                          },
                          // (String? newVal) {
                          //   setState(() {
                          //    providerWOL. qSelected = newVal!;
                          //   });
                          // },
                          value: providerWOL.qSelected,
                        ),
                        //  TextFormField(
                        //   controller: providerWOL.genderController,
                        //   validator: (value) =>
                        //       providerWOL.aboutValidation(value),
                        //   decoration: textfocus('gender'),
                        // ),
                      ),
                     
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: TextFormField(
                            controller: providerWOL.countryController,
                            validator: (value) =>
                                providerWOL.aboutValidation(value),
                            decoration: textfocus('country')),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: TextFormField(
                          controller: providerWOL.stateController,
                          validator: (value) =>
                              providerWOL.aboutValidation(value),
                          decoration: textfocus('state'),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: TextFormField(
                          controller: providerWOL.cityController,
                          validator: (value) =>
                              providerWOL.aboutValidation(value),
                          decoration: textfocus('city'),
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
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                          ),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              log("setttttt");
                              providerWOL.updateAboutProvider(context);
                            }
                          },
                          child: const Text("save")),
                    ),
                  ),
                ],
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
                              builder: (context) => const FounderProfile()));
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
                              builder: (context) => const CoFounderProfile()));
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
    );
  }
}

// child: Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //       width: double.infinity,
            //       height: MediaQuery.of(context).size.height * 0.08,
            //       decoration: const BoxDecoration(
            //         color: Colors.white38,
            //         borderRadius: BorderRadius.all(Radius.circular(10)),
            //       ),
            //       child: TextButton(
            //         onPressed: () {
            //           Navigator.of(context).push(MaterialPageRoute(
            //               builder: (context) => const FounderProfile()));
            //         },
            //         child: Text.rich(
            //           TextSpan(
            //             text: "set up your",
            //             style: const TextStyle(
            //                 color: Color.fromARGB(255, 105, 153, 189),
            //                 fontSize: 16),
            //             children: <InlineSpan>[
            //               const TextSpan(
            //                 text: " foundr",
            //                 style: TextStyle(
            //                     color: Color.fromARGB(255, 50, 103, 137),
            //                     fontSize: 18),
            //               ),
            //               TextSpan(
            //                 text: ".",
            //                 style:
            //                     TextStyle(color: Colors.red[600], fontSize: 28),
            //               ),
            //               const TextSpan(
            //                 text: "profile",
            //                 style: TextStyle(
            //                     color: Color.fromARGB(255, 105, 153, 189),
            //                     fontSize: 16),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       width: double.infinity,
            //       height: MediaQuery.of(context).size.height * 0.08,
            //       decoration: const BoxDecoration(
            //         color: Colors.white38,
            //         borderRadius: BorderRadius.all(Radius.circular(10)),
            //       ),
            //       child: TextButton(
            //         onPressed: () {
            //           Navigator.of(context).push(MaterialPageRoute(
            //               builder: (context) => const CoFounderProfile()));
            //         },
            //         child: Text.rich(
            //           TextSpan(
            //             text: "set up your",
            //             style: const TextStyle(
            //                 color: Color.fromARGB(255, 105, 153, 189),
            //                 fontSize: 16),
            //             children: <InlineSpan>[
            //               const TextSpan(
            //                 text: " co-foundr",
            //                 style: TextStyle(
            //                     color: Color.fromARGB(255, 50, 103, 137),
            //                     fontSize: 18),
            //               ),
            //               TextSpan(
            //                 text: ".",
            //                 style:
            //                     TextStyle(color: Colors.red[600], fontSize: 28),
            //               ),
            //               const TextSpan(
            //                 text: "profile",
            //                 style: TextStyle(
            //                     color: Color.fromARGB(255, 105, 153, 189),
            //                     fontSize: 16),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),