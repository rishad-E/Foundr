import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.mentorImage,
    required this.mentorName,
  });
  final String mentorImage;
 final String mentorName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.24,
      width: MediaQuery.of(context).size.width * 0.42,
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
              child: Image(
                image: NetworkImage(mentorImage),
                fit: BoxFit.cover,
              ),
            ),
            Align(
              // alignment: Alignment.bottomLeft,
              child: Text(
                mentorName,
                style: const TextStyle(
                    color: Color.fromARGB(255, 50, 103, 137),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
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
}
