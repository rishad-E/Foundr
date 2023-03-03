

import 'package:flutter/material.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/splash-provider/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashscreenProvider>(context, listen: false)
        .splashTimer(context);
    return Scaffold(
      backgroundColor: backgroundColorConst,
      body: Center(
        child: appBarLogo(context, 0.5),
      ),
    );
  }
}
