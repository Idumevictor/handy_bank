import 'dart:async';

import 'package:flutter/material.dart';
import 'package:handy_bank/app/presentation/onboarding_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:handy_bank/widgets/size_config.dart';

import '../../widgets/constants.dart';
import '../../widgets/reuseables/general_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return AnimatedSplashScreen(
      centered: true,
      backgroundColor: Palette.primaryColor1,
      duration: 2500,
      splashTransition: SplashTransition.scaleTransition,
      splash: Column(
        children: [
          Image(image: AssetImage('images/splashscreen.png')),
          createGeneralText(
              inputText: 'Handy Bank',
              fontSize: 64,
              family: FontFamily.gilroy,
              weight: FontWeight.bold,
              colorName: Palette.primaryColor2),
        ],
      ),
      nextScreen: Onboarding(),
      splashIconSize: 250,
    );
  }
}
