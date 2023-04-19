import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:handy_bank/app/presentation/sign_up.dart';
import 'package:handy_bank/app/presentation/log_in_page.dart';
import 'package:handy_bank/widgets/constants.dart';
import 'package:handy_bank/widgets/reuseables/general_text.dart';
import 'package:handy_bank/widgets/size_config.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.primaryColor1,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 54,
                child: Center(
                  child: createGeneralText(
                      inputText: 'Welcome to Handy Bank',
                      fontSize: 20,
                      family: FontFamily.gilroy,
                      weight: FontWeight.w700,
                      colorName: Palette.textColor),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(93),
              ),
              Image(
                image: AssetImage('images/onboarding1.png'),
              ),
              SizedBox(
                height: 93,
              ),
              createGeneralText(
                  inputText: 'Manage your finance in\nthe easiest way',
                  fontSize: 26,
                  family: FontFamily.gilroy,
                  weight: FontWeight.normal,
                  colorName: Palette.textColor,
                  textAlign: TextAlign.center),
              SizedBox(
                height: getProportionateScreenHeight(48),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Palette.primaryColor2,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  onPressed: (() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext) => SignUp()));
                  }),
                  child: createGeneralText(
                      inputText: 'Sign Up',
                      fontSize: 20,
                      family: FontFamily.clashVariable,
                      weight: FontWeight.w600,
                      colorName: Palette.textColor),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(24),
              ),
              RichText(
                text: TextSpan(
                    text: 'Have an account?',
                    style: TextStyle(
                        color: Palette.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Sign In ',
                          style: TextStyle(
                              color: Palette.primaryColor2,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext) => LogIn()));
                            })
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
