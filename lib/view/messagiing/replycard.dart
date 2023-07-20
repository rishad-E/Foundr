import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';

Widget replaycard(context, String mssg) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(156, 80, 83, 93),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                mssg,
                style:const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      hBoxS
    ],
  );
}
