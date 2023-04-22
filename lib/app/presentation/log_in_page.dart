import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:handy_bank/app/presentation/retrieve_account.dart';
import 'package:handy_bank/core/loading_widget.dart';
import 'package:handy_bank/data/token_storage.dart';
import 'package:handy_bank/model/request_model/log_in_request_model.dart';
import 'package:handy_bank/service/login_service.dart';
import 'package:handy_bank/widgets/constants.dart';
import 'package:handy_bank/widgets/reuseables/general_text.dart';
import 'package:handy_bank/widgets/size_config.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isVisible = true;
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.primaryColor1,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(27),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      createGeneralText(
                          inputText: 'Welcome Back',
                          fontSize: 20,
                          family: FontFamily.clashVariable2,
                          weight: FontWeight.w700,
                          colorName: Palette.textColor),
                      Container(
                        height: getProportionateScreenHeight(44),
                        width: getProportionateScreenWidth(44),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Palette.textColor,
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: getProportionateScreenWidth(30),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(32),
                  ),
                  createGeneralText(
                      inputText: 'Sign in to continue',
                      fontSize: 14,
                      family: FontFamily.clashVariable2,
                      weight: FontWeight.w400,
                      colorName: Palette.textColor),
                  SizedBox(
                    height: getProportionateScreenHeight(32),
                  ),
                  createGeneralText(
                      inputText: 'Phone Number',
                      fontSize: 14,
                      family: FontFamily.clashVariable2,
                      weight: FontWeight.w500,
                      colorName: Palette.textColor),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff5f5f5)),
                          borderRadius: BorderRadius.circular(10)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xfff5f5f5),
                      hintText: 'Your phone number',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(37),
                  ),
                  createGeneralText(
                      inputText: 'Password',
                      fontSize: 14,
                      family: FontFamily.clashVariable2,
                      weight: FontWeight.w500,
                      colorName: Palette.textColor),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isVisible,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xfff5f5f5)),
                            borderRadius: BorderRadius.circular(10)),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xfff5f5f5),
                        hintText: '**********',
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                                print(isVisible);
                              });
                            },
                            child: isVisible
                                ? Icon(
                                    Icons.visibility,
                                    color: Palette.textColor,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Palette.textColor,
                                  ))),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(150),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(60),
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Palette.primaryColor2,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ))),
                        onPressed: (() {
                          logInUser();
                        }),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Palette.textColor,
                            fontSize: getProportionateScreenWidth(20),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Lato-Regular',
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void logInUser() async {
    if (_key.currentState?.validate() ?? false) {
      _key.currentState?.save();
      LogInUserRequestModel logInUser = LogInUserRequestModel(
          phoneNumber: _phoneNumberController.text,
          password: _passwordController.text);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              ProgressDialog(message: 'Loading...'));
      var response = await LogInUserService.LogIn(logInUser);
      if (response!.message == 'Logged in successfully') {
        await TokenStorage.storeToken(response.token.toString());

        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext) => RetrieveNumberScreen()));
      } else {
        Navigator.pop(context);
      }
    }
  }
}
