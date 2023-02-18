import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/view/Article/articlehome/article_home.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';

Widget matchingProfile(context) {
  return Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const CircleAvatar(
          radius: 36,
          backgroundColor: Color.fromARGB(255, 30, 30, 30),
          // backgroundImage: AssetImage('assets/images/user2.png'),
        ),
        const Text('Rishad', style: textStyle),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 105, 153, 189)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Show profile',
            style: TextStyle(
                fontSize: 10, color: Color.fromARGB(255, 231, 231, 231)),
          ),
        )
      ],
    ),
  );
}

 

Widget eventCard(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.24,
    width: MediaQuery.of(context).size.width * 0.4,
    child: Card(
      // color: Colors.yellow,
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 105, 153, 189),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(
                Icons.bookmark,
                color: Color.fromARGB(255, 105, 153, 189),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget homeContainer(BuildContext context, {childwidget, Color? color}) {
  return Container(
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.29,
      width: MediaQuery.of(context).size.width * 0.65,
      decoration: BoxDecoration(
        color: color,
        // border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: childwidget);
}


Widget appBarHome(BuildContext context) {
  return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      },
      child: const Text("Home "));
}

Widget appBarArticleHome(BuildContext context) {
  return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ArticleHome(),
        ));
      },
      child: const Text("Article "));
}