import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/shimmereffect.dart';
import 'package:founder_app/common/widgets/widget_article.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/model/article/article_model.dart';
import 'package:founder_app/services/article/article_service.dart';
import 'package:founder_app/view/article/arclewelcome/article_screen.dart';
import 'package:intl/intl.dart';

class ArticleWelcome extends StatelessWidget {
  const ArticleWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorConst,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: appBarLogo(context, 0.3),
        actions: [
          appBarWelcome(context),
          TextButton(onPressed: () {}, child: const Text("Articles ")),
          wBox
        ],
      ),
      body: Center(
        child: Column(
          children: [
            hBox,
            textNormalHeading("Articles"),
            hBox,
            SizedBox(
              // color: Colors.yellow,
              height: MediaQuery.of(context).size.height * 0.78,
              width: MediaQuery.of(context).size.width * 0.9,
              child: FutureBuilder<List<Article>?>(
                future: ArticleService().getArticleService(context),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const ShimmerEffectEvent();
                    // return const Center(child: CircularProgressIndicator());
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 7,
                        childAspectRatio: 5.5 / 7,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ArticleScreen(
                                    name: snapshot.data![index].title!,
                                    content: snapshot.data![index].content!,
                                    image: snapshot.data![index].coverImage!,
                                    date: dateChange(snapshot
                                        .data![index].createdAt
                                        .toString())),
                              ),
                            );
                          },
                          child: ArticleWidget(
                              avatar: snapshot.data![index].coverImage!,
                              title: snapshot.data![index].title!,
                              dateTime: dateChange(
                                  snapshot.data![index].createdAt.toString())
                              ),
                        );
                      },
                    );
                  }
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  dateChange(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatteddate = DateFormat('dd-MMMM-yyyy', 'en_US').format(dateTime);
    formatteddate = formatteddate.toLowerCase();
    String formattedDate = formatteddate.replaceFirst(
        formatteddate.substring(3, 4),
        formatteddate.substring(3, 4).toUpperCase());
    return formattedDate;
  }
}
