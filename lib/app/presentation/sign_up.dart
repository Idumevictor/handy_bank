import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:handy_bank/app/presentation/log_in_page.dart';
import 'package:handy_bank/core/loading_widget.dart';
import 'package:handy_bank/data/token_storage.dart';
import 'package:handy_bank/model/request_model/sign_up_request_model.dart';
import 'package:handy_bank/model/response_model/sign_up_response_model.dart';
import 'package:handy_bank/service/signup_service.dart';
import 'package:handy_bank/widgets/constants.dart';
import 'package:handy_bank/widgets/reuseables/general_text.dart';
import 'package:handy_bank/widgets/size_config.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isVisible = true;
  bool isVisible1 = true;
  final _firstController = TextEditingController();
  final _lastController = TextEditingController();
  final _emailController = TextEditingController();
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
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
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
                          inputText: 'Welcome User',
                          fontSize: 20,
                          family: FontFamily.clashVariable2,
                          weight: FontWeight.w600,
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
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(22),
                  ),
                  createGeneralText(
                      inputText: 'Sign up to join',
                      fontSize: 14,
                      family: FontFamily.clashVariable2,
                      weight: FontWeight.w400,
                      colorName: Palette.textColor),
                  SizedBox(
                    height: 40,
                  ),
                  createGeneralText(
                      inputText: 'First Name',
                      fontSize: 14,
                      family: FontFamily.clashVariable2,
                      weight: FontWeight.w500,
                      colorName: Palette.textColor),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _firstController,
                    validator: (value) {
                      if (_firstController.text.isEmpty) {
                        return 'Enter first name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xfff5f5f5)),
                          borderRadius: BorderRadius.circular(10)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: const Color(0xfff5f5f5),
                      hintText: 'Your first name',
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  createGeneralText(
                      inputText: 'Last Name',
                      fontSize: 14,
                      family: FontFamily.clashVariable2,
                      weight: FontWeight.w500,
                      colorName: Palette.textColor),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _lastController,
                    validator: (value) {
                      if (_lastController.text.isEmpty) {
                        return 'Enter Last name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xfff5f5f5)),
                          borderRadius: BorderRadius.circular(10)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: const Color(0xfff5f5f5),
                      hintText: 'Your last name',
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  createGeneralText(
                      inputText: 'Email',
                      fontSize: 14,
                      family: FontFamily.clashVariable2,
                      weight: FontWeight.w500,
                      colorName: Palette.textColor),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xfff5f5f5)),
                            borderRadius: BorderRadius.circular(10)),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: const Color(0xfff5f5f5),
                        hintText: 'Your email@gmail.com',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (_emailController.text.isEmpty) {
                          return 'Enter email address';
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  createGeneralText(
                      inputText: 'Password',
                      fontSize: 14,
                      family: FontFamily.clashVariable2,
                      weight: FontWeight.w500,
                      colorName: Palette.textColor),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (_passwordController.text.length < 8) {
                        return 'Enter Password';
                      } else {
                        return null;
                      }
                    },
                    obscureText: isVisible,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xfff5f5f5)),
                            borderRadius: BorderRadius.circular(10)),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xfff5f5f5),
                        hintText: '**********',
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
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
                    height: 12,
                  ),
                  createGeneralText(
                      inputText: 'Phone Number',
                      fontSize: 14,
                      family: FontFamily.clashVariable2,
                      weight: FontWeight.w500,
                      colorName: Palette.textColor),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    validator: (value) {
                      if (_phoneNumberController.text.length < 11) {
                        return 'Enter complete phone number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff5f5f5)),
                          borderRadius: BorderRadius.circular(10)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xfff5f5f5),
                      hintText: '081',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Palette.primaryColor2,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'I agree to the ',
                            style: TextStyle(
                                color: Palette.textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Terms of service ',
                                  style: TextStyle(
                                      color: Palette.primaryColor2,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 50,
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext) => LogIn()));
                        }),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Palette.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Lato-Regular',
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Have an account?',
                          style: TextStyle(
                              color: Palette.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign In ',
                                style: TextStyle(
                                    color: Palette.primaryColor2,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                                LogIn()));
                                  })
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createAccount() async {
    if (_key.currentState?.validate() ?? false) {
      _key.currentState?.save();

      SignUpUserRequestModel registerUserRequestModel = SignUpUserRequestModel(
          firstName: _firstController.text,
          lastName: _lastController.text,
          emailAddress: _emailController.text,
          password: _passwordController.text,
          phoneNumber: _phoneNumberController.text);

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              ProgressDialog(message: 'Loading...'));

      var response = await SignUPUserService.signUp(registerUserRequestModel);
      if (response!.message == 'User Created Successfully') {
        await TokenStorage.storeToken(response.newUser.toString());
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext) => LogIn()));
        Navigator.pop(context);
      }
    }
  }
}
