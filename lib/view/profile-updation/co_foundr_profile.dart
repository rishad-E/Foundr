import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/profile-provider/profile_provider.dart';
import 'package:founder_app/view/profile-updation/profile-screen.dart';
import 'package:provider/provider.dart';

class CoFounderProfile extends StatelessWidget {
  CoFounderProfile({super.key});

  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColorConst,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          actions: [appBarLogo(context, 0.3), wBox],
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(bottom: 15, top: 10),
            child: Container(
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
                child: SingleChildScrollView(
                  child: Consumer<ProfileProvider>(
                    builder: (context, data, child) {
                      return Column(
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
                            iconSize: 30,
                            isExpanded: true,
                            items:
                                data.question0items.map((String dropdownVal) {
                              return DropdownMenuItem<String>(
                                value: dropdownVal,
                                child: Text(
                                  dropdownVal,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              data.onchangeSeeking(value!);
                            },
                            value: data.q0Selected,
                            validator: (value) => data.onchangeSeeking(value!),
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
                            iconSize: 30,
                            items:
                                data.question1items.map((String dropdownVal) {
                              return DropdownMenuItem<String>(
                                value: dropdownVal,
                                child: Text(
                                  dropdownVal,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              data.onchangeTechnical(value!);
                            },
                            value: data.q1Selected,
                            validator: (value) =>
                                data.onchangeTechnical(value!),
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
                            iconSize: 30,
                            items:
                                data.question2items.map((String dropdownVal) {
                              return DropdownMenuItem<String>(
                                value: dropdownVal,
                                child: Text(
                                  dropdownVal,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              data.onchangeIdea(value!);
                            },
                            value: data.q2Selected,
                            validator: (value) => data.onchangeIdea(value!),
                          ),
                          hBox,
                          const Text(
                            "Do you have a location preferences",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          DropdownButtonFormField<String>(
                            iconSize: 30,
                            isExpanded: true,
                            items:
                                data.question3items.map((String dropdownVal) {
                              return DropdownMenuItem<String>(
                                value: dropdownVal,
                                child: Text(
                                  dropdownVal,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              data.onchangeLocation(value!);
                            },
                            value: data.q3Selected,
                            validator: (value) => data.onchangeLocation(value!),
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
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 105, 153, 189)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: data.responsibilitySelected!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 163, 184, 201),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 105, 153, 189)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child:
                                      Text(data.responsibilitySelected![index]),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 5),
                            ),
                          ),
                          hBoxS,
                          DropdownButtonFormField(
                            items: data.responsibilityItems.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              );
                            }).toList(),
                            onChanged: (newvalue) {
                              data.onchangeResponsibility(newvalue!);
                            },
                            value: data.respo,
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
                                    if (formkey.currentState!.validate()) {
                                      data.updateCofounderProvider(context);
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                        builder: (context) => ProfileScreen(),
                                      ));
                                    }
                                  },
                                  child: const Text(
                                    "SAVE",
                                    style: textStyle,
                                  )),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
