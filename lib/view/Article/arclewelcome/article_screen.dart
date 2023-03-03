import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/model/article/article_model.dart';
import 'package:founder_app/services/article/article_service.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<List<Article>?>(
            future: ArticleService().getArticleService(context),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    hBox,
                    textHeading(name),
                    hBox,
                    SizedBox(
                      // color: Colors.yellow,
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.height * 0.3,
                      // color: Colors.transparent,
                      child: Center(child: Image.network(image)),
                    ),
                    hBox,
                    // hBox,
                    descriptionText(content),
                    hBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        descriptionText(date),
                      ],
                    )
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
