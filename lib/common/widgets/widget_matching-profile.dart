// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';

class MatchingProfilesHome extends StatelessWidget {
  final String name;
 final String userImage;
  const MatchingProfilesHome({
    super.key,
    required this.name,
    required this.userImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            // child: Icon(Icons.person),
            backgroundImage: NetworkImage(
              userImage,
              // 'assets/images/event-image.png'
            ),
          ),
          Text(name, style: textStyle),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 105, 153, 189)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
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
}
