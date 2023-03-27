import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final String avatar;
  final String title;
  // final String subtitle;
  final String dateTime;
  const ArticleWidget(
      {super.key,
      required this.avatar,
      required this.title,
      // required this.subtitle,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      // height: MediaQuery.of(context).size.height * 0.4,
      // width: MediaQuery.of(context).size.width * 0.5,
      decoration: const BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            // width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.network(avatar).image, fit: BoxFit.fill),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            // child: Image.network(avatar),
          ),
          Text(
            title,
            maxLines: 1,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Color.fromARGB(255, 105, 153, 189),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          // Text(
          //   subtitle,
          //   maxLines: 2,
          //   style: const TextStyle(
          //       overflow: TextOverflow.ellipsis,
          //       fontSize: 13,
          //       color: Color.fromARGB(255, 105, 153, 189)),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                dateTime,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 105, 153, 189),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
