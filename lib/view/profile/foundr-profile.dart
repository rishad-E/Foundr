// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';

class FounderProfile extends StatefulWidget {
  const FounderProfile({super.key});

  @override
  State<FounderProfile> createState() => _FounderProfileState();
}

class _FounderProfileState extends State<FounderProfile> {
  var question1Items = [
    'select one',
    'YES',
    'NO',
  ];
  String q1Selected = 'select one';
  final question2items = [
    'select one',
    'Yes, I am committed to an idea and i want a co-founder',
    'I have some ideas ,but iam open to explore other ideas',
    'No i could help a co-founder with their existing idea or explore new ideas together'
  ];
  String q2Selected = 'select one';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // height: 800,
          padding: const EdgeInsets.all(15),
          // color: Colors.greenAccent,
          color: backgroundColorConst,
          child: SingleChildScrollView(
            child: Column(
              children: [
                hBox,
                Container(
                  height: 350,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textHeading(" User Details"),
                      // hBoxS,
                      Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.075,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: decorTextfield("first name"),
                            ),
                          ),
                          wBoxS,
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.075,
                            width: MediaQuery.of(context).size.width * 0.4,
                            // color: Colors.yellow,
                            child: TextFormField(
                              decoration: decorTextfield("last name"),
                            ),
                          )
                        ],
                      ),
                      TextFormField(
                        decoration: decorTextfield("email"),
                      ),
                      TextFormField(
                        decoration: decorTextfield("linkedIn URL"),
                      ),
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
                              onPressed: () {},
                              child: const Text(
                                "SAVE",
                                style: textStyle,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                hBox,
                hBox,
                Container(
                  height: 950,
                  width: 350,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    // color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textNormalHeading("More About You"),
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
                      DropdownButton<String>(
                        isExpanded: true,
                        elevation: 5,
                        items: question1Items.map((String dropdownVal) {
                          return DropdownMenuItem<String>(
                            value: dropdownVal,
                            child: Text(dropdownVal),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            q1Selected = newVal!;
                          });
                        },
                        value: q1Selected,
                      ),
                      hBoxS,
                      const Text(
                        "Do You already have an startup or an idea that you are set on ..?",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      hBoxS,
                     DropdownButton<String>(
                        isExpanded: true,
                        elevation: 5,
                        items: question2items.map((String dropdownVal1) {
                          return DropdownMenuItem<String>(
                            value: dropdownVal1,
                            child: Text(dropdownVal1),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            q2Selected = newVal!;
                          });
                        },
                        value: q2Selected,
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
                        decoration: decorTextfield(),
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
                        decoration: decorTextfield(),
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
                        decoration: decorTextfield(),
                      ),
                      hBox,
                      const Text(
                        "Which areas of startup are you willing to take responsiblity for",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      hBoxS,
                      TextFormField(
                        decoration: decorTextfield(),
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
                      TextFormField(
                        decoration: decorTextfield(),
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
                              onPressed: () {},
                              child: const Text(
                                "SAVE",
                                style: textStyle,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
