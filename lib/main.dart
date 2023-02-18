import 'package:flutter/material.dart';
import 'package:founder_app/controller/provider/otp_provider/otp_provider.dart';
import 'package:founder_app/controller/provider/sign_in_provider/sign_in_provider.dart';
import 'package:founder_app/controller/provider/sign_up_provider/sign_up_provider.dart';
// import 'package:founder_app/screens/homescreen.dart';
import 'package:founder_app/view/splash/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext  context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SigninProvider()),
        ChangeNotifierProvider(create: (context) => SignupProvider()),
        // ChangeNotifierProvider(create: (context) => OtpProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // useMaterial3: true
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
