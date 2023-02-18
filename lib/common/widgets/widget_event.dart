import 'package:flutter/material.dart';

Future<dynamic> showDialogEvent(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 30,
        backgroundColor: const Color.fromARGB(223, 43, 9, 53),
        title: const Text('Delete Playlist',
            style: TextStyle(
                fontFamily: 'UbuntuCondensed',
                fontWeight: FontWeight.bold,
                fontSize: 22),
            textAlign: TextAlign.center),
        content: const Text('Are Yout Sure You Want To Delete This Playlist',
            style: TextStyle(fontFamily: 'UbuntuCondensed')),
        actions: [
          TextButton(
              child: const Text(
                'No',
                style: TextStyle(fontFamily: 'UbuntuCondensed', fontSize: 18),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          TextButton(
            child: const Text(
              'Yes',
            ),
            onPressed: () {},
          )
        ],
      );
    },
  );
}
