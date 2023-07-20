// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/profile-provider/profile_provider.dart';
import 'package:founder_app/view/profile-updation/profile-screen.dart';
import 'package:provider/provider.dart';

class FounderProfile extends StatelessWidget {
  FounderProfile({super.key});
  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: Container(
          padding: const EdgeInsets.all(15),
          color: backgroundColorConst,
          child: Container(
            // height: 950,
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
                            child: textHeading("More About You")),
                        hBoxS,
                        const Text(
                          "Are You Technical..?",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          "You are a programmer,scientist or engineer who can built the product without outside assistance",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 105, 153, 189)),
                        ),
                        DropdownButtonFormField<String>(
                          isExpanded: true,
                          iconSize: 30,
                          items: data.question1Fitems.map((String dropdownVal) {
                            return DropdownMenuItem<String>(
                              value: dropdownVal,
                              child: Text(
                                dropdownVal,
                                style: const TextStyle(fontSize: 13),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newVal) {
                            data.onchanngeFtechnical(newVal!);
                          },
                          value: data.q1FSelected,
                          validator: (value) =>
                              data.onchanngeFtechnical(value!),
                        ),
                        hBoxS,
                        const Text(
                          "Do You already have an startup or an idea that you are set on ..?",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        hBoxS,
                        DropdownButtonFormField<String>(
                          isExpanded: true,
                          iconSize: 30,
                          items:
                              data.question2Fitems.map((String dropdownVal1) {
                            return DropdownMenuItem<String>(
                              value: dropdownVal1,
                              child: Text(
                                dropdownVal1,
                                style: const TextStyle(fontSize: 13),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newVal) {
                            data.onchangeFIdea(newVal!);
                          },
                          value: data.q2FSelected,
                          validator: (value) => data.onchangeFIdea(value!),
                        ),
                        hBoxS,
                        const Text(
                          "Impressive accomplishment",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "Write about your great accomplishment so far",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 105, 153, 189)),
                        ),
                        hBoxS,
                        TextFormField(
                          controller: data.accomplishController,
                          decoration: decorTextfield(),
                          validator: (value) => data.fieldValidation(value!),
                        ),
                        hBox,
                        const Text(
                          "Education",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "Scools,degrees including field of study and years of graduation",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 105, 153, 189)),
                        ),
                        hBoxS,
                        TextFormField(
                          controller: data.educationContoller,
                          decoration: decorTextfield(),
                          validator: (value) => data.fieldValidation(value!),
                        ),
                        hBox,
                        const Text(
                          "Employment",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "Employees,positions/titles,most recent first",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 105, 153, 189)),
                        ),
                        hBoxS,
                        TextFormField(
                          controller: data.employmentController,
                          decoration: decorTextfield(),
                          validator: (value) => data.fieldValidation(value!),
                        ),
                        hBox,
                        const Text(
                          "Which areas of startup are you willing to take responsiblity for",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        hBoxS,
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 105, 153, 189)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.responsFounderSelected!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 163, 184, 201),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 105, 153, 189)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                ),
                                child: Text(
                                  data.responsFounderSelected![index],
                                  style: const TextStyle(fontSize: 13),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 5),
                          ),
                        ),
                        hBoxS,
                        DropdownButtonFormField(
                          // hint: Text("select"),
                          items: data.responsFounderitems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: const TextStyle(fontSize: 13),
                              ),
                            );
                          }).toList(),
                          onChanged: (newvalue) {
                            data.onchangeResponsFounder(newvalue!);
                          },
                          value: data.respFounder,
                        ),
                        hBox,
                        const Text(
                          "which topics and industries you interested in..?",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "We'll try to show more profiles from founder with common interests",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 105, 153, 189)),
                        ),
                        hBoxS,
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 105, 153, 189)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.intrestedSelected!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 163, 184, 201),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 105, 153, 189)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                ),
                                child: Text(
                                  data.intrestedSelected![index],
                                  style: const TextStyle(fontSize: 13),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 5),
                          ),
                        ),
                        DropdownButtonFormField(
                          items: data.intresteditems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: const TextStyle(fontSize: 13),
                              ),
                            );
                          }).toList(),
                          onChanged: (newvalue) {
                            data.onchangeInterest(newvalue!);
                          },
                          value: data.respFounder,
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
                                  color:
                                      const Color.fromARGB(255, 105, 153, 189)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    data.updateFounderProvider(context);
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
    );
  }
}
