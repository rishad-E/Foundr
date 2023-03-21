import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/profile-provider/profile_provider.dart';
import 'package:provider/provider.dart';

class CoFounderProfile extends StatelessWidget {
  CoFounderProfile({super.key});
  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColorConst,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:const Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          actions: [appBarLogo(context, 0.3), wBox],
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(bottom: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  hBox,
                  Container(
                    height: 750,
                    width: 350,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      // color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: textHeading("Co-founder Preferences"),
                          ),
                          hBoxS,
                          const Text(
                            "Are you Actively seeking a co-founder..?",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            "We can help you find others interest in finding a co-founder",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 105, 153, 189)),
                          ),
                          hBoxS,
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            items: provider.question0items
                                .map((String dropdownVal) {
                              return DropdownMenuItem<String>(
                                value: dropdownVal,
                                child: Text(
                                  dropdownVal,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              provider.onchangeSeeking(value!);
                            },
                            value: provider.q0Selected,
                            validator: (value) =>
                                provider.onchangeSeeking(value!),
                          ),
                          hBoxS,
                          const Text(
                            "Do You prefer either technical or non-technical profiles..?",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          hBoxS,
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            items: provider.question1items
                                .map((String dropdownVal) {
                              return DropdownMenuItem<String>(
                                value: dropdownVal,
                                child: Text(
                                  dropdownVal,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              provider.onchangeTechnical(value!);
                            },
                            value: provider.q1Selected,
                            validator: (value) =>
                                provider.onchangeTechnical(value!),
                          ),
                          hBoxS,
                          const Text(
                            "Are you looking for a co-founder who already has a idea, or you open to explore new ideas together",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          hBoxS,
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            items: provider.question2items
                                .map((String dropdownVal) {
                              return DropdownMenuItem<String>(
                                value: dropdownVal,
                                child: Text(
                                  dropdownVal,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              provider.onchangeIdea(value!);
                            },
                            value: provider.q2Selected,
                            validator: (value) => provider.onchangeIdea(value!),
                          ),
                          hBox,
                          const Text(
                            "Do you have a location preferences",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            items: provider.question3items
                                .map((String dropdownVal) {
                              return DropdownMenuItem<String>(
                                value: dropdownVal,
                                child: Text(
                                  dropdownVal,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              provider.onchangeLocation(value!);
                            },
                            value: provider.q3Selected,
                            validator: (value) =>
                                provider.onchangeGeder(value!),
                          ),
                          hBox,
                          const Text(
                            "Which areas would you like a co-founder to take responsibility for...?",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            "We may show you profiles that dont meet your preferences if there aren't enough candidates who selected the relevant responsibility areas",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 105, 153, 189)),
                          ),
                          hBoxS,
                          SizedBox(
                            height: 50,
                            // decoration: BoxDecoration(
                            //   // color: Colors.amber,
                            //   border: Border.all(
                            //       color:
                            //           const Color.fromARGB(255, 105, 153, 189)),
                            //   borderRadius:
                            //       const BorderRadius.all(Radius.circular(10)),
                            // ),
                            child: TextFormField(
                              decoration: decorTextfield(),
                              validator: (value) {
                                if (value == null) {
                                  return 'tpe';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          hBoxS,
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                // color: Colors.amber,
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 105, 153, 189)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    log(provider.q0Selected);
                                    log(provider.q1Selected);
                                    log(provider.q2Selected);
                                    log(provider.q3Selected);
                                    log(provider.seeked.toString(),name: 'see');
                                    if (formkey.currentState!.validate()) {
                                      log('settttttttttttttte');
                                    }
                                  },
                                  child: const Text(
                                    "SAVE",
                                    style: textStyle,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
