import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';

class CoFounderProfile extends StatefulWidget {
  const CoFounderProfile({super.key});

  @override
  State<CoFounderProfile> createState() => _CoFounderProfileState();
}

class _CoFounderProfileState extends State<CoFounderProfile> {
  var question1items = [
    'select one',
    'Technical',
    'Non-Technical',
    'No-preference',
  ];
  String q1Selected = 'select one';
  var question2items = [
    'select one',
    'I want a co-founder who already has a specific idea',
    'I want a co-founder who can workd on a specific idea',
    'No preferences',
  ];
  String q2Selected = 'select one';
  var question3items = [
    'select one',
    'Within a certain distance of me',
    'In My country',
    'No preferences',
  ];
  String q3Selected = 'select one';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColorConst,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                hBoxS,
                textNormalHeading("co-foundr profile"),
                // hBox,
                // Container(
                //   height: 300,
                //   width: double.infinity,
                //   padding: const EdgeInsets.all(10),
                //   decoration: const BoxDecoration(
                //     color: Colors.white70,
                //     borderRadius: BorderRadius.all(Radius.circular(10)),
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       textNormalHeading(" User Details"),
                //       // hBoxS,
                //       Row(
                //         children: [
                //           SizedBox(
                //             height: MediaQuery.of(context).size.height * 0.075,
                //             width: MediaQuery.of(context).size.width * 0.45,
                //             child: TextFormField(
                //               decoration: decorTextfield("first name"),
                //             ),
                //           ),
                //           wBoxS,
                //           SizedBox(
                //             height: MediaQuery.of(context).size.height * 0.075,
                //             width: MediaQuery.of(context).size.width * 0.39,
                //             // color: Colors.yellow,
                //             child: TextFormField(
                //               decoration: decorTextfield("last name"),
                //             ),
                //           )
                //         ],
                //       ),
                //       TextFormField(
                //         decoration: decorTextfield("email"),
                //       ),
                //       TextFormField(
                //         decoration: decorTextfield("linkedIn URL"),
                //       )
                //     ],
                //   ),
                // ),
                // hBox,
                hBox,
                Container(
                  height: 600,
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
                      textNormalHeading("Co-founder Preferences"),
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
                      const Text(
                        "Do You prefer either technical or non-technical profiles..?",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      hBoxS,
                      DropdownButton<String>(
                        isExpanded: true,
                        items: question1items.map((String dropdownVal) {
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
                        "Are you looking for a co-founder who already has a idea, or you open to explore new ideas together",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      hBoxS,
                      DropdownButton<String>(
                        isExpanded: true,
                        items: question2items.map((String dropdownVal) {
                          return DropdownMenuItem<String>(
                            value: dropdownVal,
                            child: Text(dropdownVal),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            q2Selected = newVal!;
                          });
                        },
                        value: q2Selected,
                      ),
                      hBox,
                      const Text(
                        "Do you have a location preferences",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        items: question3items.map((String dropdownVal) {
                          return DropdownMenuItem<String>(
                            value: dropdownVal,
                            child: Text(dropdownVal),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            q3Selected = newVal!;
                          });
                        },
                        value: q3Selected,
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
                        height: 50,
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          border: Border.all(
                              color: const Color.fromARGB(255, 105, 153, 189)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
