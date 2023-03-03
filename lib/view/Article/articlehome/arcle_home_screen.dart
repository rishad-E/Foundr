import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgethomescreen.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';

class ArticleHomeScreen extends StatelessWidget {
  const ArticleHomeScreen(
      {super.key,
      required this.name,
      required this.content,
      required this.date,
      required this.image});
  final String name;
  final String content;
  final String image;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            // statusBarColor: Color.fromARGB(233,238,242,255),
            statusBarColor: Colors.white),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: appBarLogo(context, 0.3),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                    (route) => false);
              },
              child: const Text("Home ")),
          appBarArticleHome(context),
          wBox
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              hBox,
              textHeading(name),
              hBox,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.height * 0.3,
                // color: Colors.grey,
                child: Center(child: Image.network(image)),
              ),
              hBox,
              hBox,
              descriptionText(content),
              hBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  descriptionText(date),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
