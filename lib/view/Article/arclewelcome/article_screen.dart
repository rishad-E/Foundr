import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen(
      {super.key,
      required this.content,
      required this.image,
      required this.name,
      required this.date});
  final String name;
  final String image;
  final String content;
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
        actions: [appBarWelcome(context), appBarArticleWelcome(context), wBox],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: backgroundColorConst,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                hBox,
                textHeading(name),
                hBox,
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColorConst,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.height * 0.35,
                  // color: Colors.grey,
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                // hBox,
                hBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    descriptionText(date),
                  ],
                ),
                hBox,
                // descriptionText(content),
                Html(data: content),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
