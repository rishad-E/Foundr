import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/sign_up_provider/sign_up_provider.dart';
import 'package:founder_app/view/sign_in_screen/sign_in_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final providerWOL = Provider.of<SignupProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColorConst,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: appBarLogo(context, 0.3),
        actions: [appBarWelcome(context), appBarArticleWelcome(context), wBox],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textHeading("SIGN UP"),
            Container(
              padding: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: decorSignup(Colors.white60),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hBox,
                    const Text(" User Name", style: textStyle),
                    TextFormField(
                      decoration: decorTextfield(),
                      controller: providerWOL.usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username field is empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    hBox,
                    const Text(" Email", style: textStyle),
                    TextFormField(
                      decoration: decorTextfield(),
                      controller: providerWOL.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email field is empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    hBox,
                    const Text(" Password", style: textStyle),
                    TextFormField(
                      decoration: decorTextfield(),
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password field is empty";
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
                              if (formKey.currentState!.validate()) {
                                providerWOL.verifyUserProvider(context);
                              }
                            },
                            child: const Text("SIGN UP",
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
                          builder: (context) => SignInScreen()));
                    },
                    child: const Text("Already have an account?..",
                        style: textStyle)),
                // TextButton(onPressed: (){}, child:const Text("Terms and conditions.", style: textStyle))
              ],
            )
          ],
        ),
      ),
    );
  }
}
