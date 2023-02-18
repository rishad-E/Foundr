import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/view/Article/arclewelcome/article_screen.dart';

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              hBox,
              const SizedBox(
                height: 60,
                child: Image(
                  image: AssetImage("assets/images/article-lcon.png"),
                ),
              ),
              // const SizedBox(height: 100)
              hBox,
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ArticleScreen(),
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: const Image(
                          image: AssetImage("assets/images/article-lcon.png"),
                        ),
                      ),
                      hBox,
                      textNormalHeading("Article Heading Here"),
                      hBox,
                      descriptionText(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                      hBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "12/03/2023",
                            style: textStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              hBox,
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ArticleScreen(),
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: const Image(
                          image: AssetImage("assets/images/article-lcon.png"),
                        ),
                      ),
                      hBox,
                      textNormalHeading("Article Heading Here"),
                      hBox,
                      descriptionText(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                      hBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "12/03/2023",
                            style: textStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              hBox
            ],
          ),
        ),
      ),
    );
  }
}






















//  Column(
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             hBox,
//             const SizedBox(
//               height: 60,
//               child: Image(
//                 image: AssetImage("assets/images/article-lcon.png"),
//               ),
//             ),
//             const SizedBox(height: 100),
//             Container(
//               padding: const EdgeInsets.all(15),
//               height: MediaQuery.of(context).size.height*0.42,
//               width:  MediaQuery.of(context).size.width*0.8,
//               decoration: const BoxDecoration(
//                 color: Colors.white60,
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 120,
//                     child: Image(
//                       image: AssetImage("assets/images/article-lcon.png"),
//                     ),
//                   ),
//                   hBox,
//                   textHeading("Article Heading Here"),
//                   hBox,
//                   descriptionText(
//                       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
//                   hBox,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: const [
//                       Text("12/03/2023",style: textStyle,),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),