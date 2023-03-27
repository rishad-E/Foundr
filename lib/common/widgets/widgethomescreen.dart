import 'package:flutter/material.dart';
import 'package:founder_app/view/article/articlehome/article_home.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';

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
