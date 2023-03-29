import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/view/drawer/drawer_home.dart';

class MessagingUser extends StatefulWidget {
  const MessagingUser({super.key});

  @override
  State<MessagingUser> createState() => _MessagingUserState();
}

class _MessagingUserState extends State<MessagingUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const HomeDrawer(),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        toolbarHeight: 70,
        backgroundColor: Colors.white,

        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: iconcolor,
            )),
        title: const Text(
          "Messager Name",
          style: TextStyle(
            color: Color.fromARGB(255, 50, 103, 137),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.79,
              width: MediaQuery.of(context).size.width,
            ),
            TextField(
              // cursorColor: color1(),
              keyboardType: TextInputType.multiline,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(17),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'message',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: const TextStyle(
                      fontSize: 14,color: Color.fromARGB(255, 50, 103, 137), ),
                  filled: true,
                  fillColor:const Color.fromARGB(255, 121, 161, 191),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        size: 25,
                        color: Colors.black,
                      ),
                      splashColor: Colors.transparent,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
