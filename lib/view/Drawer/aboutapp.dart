import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/view/drawer/privacypolicy.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  final String supportEmail = 'rishadedassery987@gmail.com';
  final String supportPhoneNumber = '7034527959';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mediumHeading("About This Application"),
                  descriptionText("Welcome to our application!"),
                  descriptionText(
                      "Our application The JobPortal-PartnerFinder is an innovative application designed to connect individuals with project ideas and those seeking talented collaborators. It aims to provide a platform where users can find suitable partners according to their preferences, interests, and skills for working on interesting projects."),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mediumHeading("Key Features"),
                      hBoxS,
                      descriptionText("● Find the best for your Start-up"),
                      descriptionText("● Connect to Like-Minded People"),
                      descriptionText("● Events hosted by Tech Giants"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mediumHeading("Privacy Policy"),
                      hBoxS,
                      Text.rich(
                        TextSpan(
                          text:
                              'Protecting your privacy is important to us. Please refer to our separate ',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 105, 153, 189),
                          ),
                          children: [
                            TextSpan(
                              text: 'privacy policy page',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PrivacyPolicy(),
                                    ),
                                  );
                                },
                            ),
                            const TextSpan(
                              text:
                                  ' to understand how we collect, use, and protect your personal information.',
                              style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 105, 153, 189),),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mediumHeading("Feedback and Support"),
                      hBoxS,
                      descriptionText(
                          "We value your feedback! If you encounter any issues, have suggestions for improvement, or need assistance, please don't hesitate to contact our support team."),
                      hBoxS,
                      Text.rich(
                        TextSpan(
                          text: 'Email: ',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 50, 103, 137),
                          ),
                          children: [
                            TextSpan(
                              text: supportEmail,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () {
                              //     url_launcher.launch('mailto:$supportEmail');
                              //   },
                            ),
                          ], 
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text.rich(
                        TextSpan(
                          text: 'Phone: ',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 50, 103, 137),
                          ),
                          children: [
                            TextSpan(
                              text: supportPhoneNumber,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () {
                              //     // launchUrlString('tel:$supportPhoneNumber');
                              //   },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  descriptionText("""Sincerely,
        
Rishad E"""),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
