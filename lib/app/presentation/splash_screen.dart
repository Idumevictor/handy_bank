import 'dart:async';

import 'package:flutter/material.dart';
import 'package:handy_bank/app/presentation/onboarding_screen.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext) => Onboarding())));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.primaryColor1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(342),
          ),
          Center(child: Image(image: AssetImage('images/splashscreen.png'))),
          Center(
            child: createGeneralText(
                inputText: 'Handy Bank',
                fontSize: 64,
                family: FontFamily.gilroy,
                weight: FontWeight.bold,
                colorName: Palette.primaryColor2),
          ),
        ],
      ),
    );
  }
}
