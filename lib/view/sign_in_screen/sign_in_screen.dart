import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/sign_in_provider/sign_provider.dart';
import 'package:founder_app/view/sign_up_screen/sign_up_screen.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final providerWOL = Provider.of<SigninProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColorConst,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: appBarLogo(context, 0.3),
        actions: [appBarHome(context), appBarArticle(context), wBox],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textHeading("SIGN IN"),
            Container(
              padding: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: decorSignup(Colors.white60),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Text(" Email", style: textStyle),
                    TextFormField(
                      
                      decoration: decorTextfield(),
                      controller: providerWOL.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Spacer(),
                    const Text(" Password", style: textStyle),
                    TextFormField(
                      // keyboardType: TextInputType.phone,
                      obscureText: true,
                      decoration: decorTextfield(),
                      controller: providerWOL.passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password is empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: decorSignup(
                            const Color.fromARGB(255, 50, 103, 137),
                          ),
                          child: TextButton(
                            onPressed: () {
                              log("sign in button in sign in page pressed");
                              if (formkey.currentState!.validate()) {
                                providerWOL.signinCheck(context);
                              }
                            },
                            child: const Text("SIGN IN",
                                style: TextStyle(color: Colors.white)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen()));
                    },
                    child: const Text("New Here?...Go To Sign Up",
                        style: textStyle)),
                // Text("Terms and conditions.", style: textStyle)
              ],
            )
          ],
        ),
      ),
    );
  }
}
