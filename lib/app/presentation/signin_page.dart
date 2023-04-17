import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
              key: _signUpKey,
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
                          size: 30,
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
                  // Text(
                  //   'Password',
                  //   style: TextStyle(
                  //       color: Color(0xff484848),
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w500,
                  //       fontFamily: 'Lato-Regular'),
                  // ),
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
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.end,
//                   //   children: [
//                   //     TextButton(
//                   //       onPressed: () {
//                   //         Navigator.of(context).push(MaterialPageRoute(
//                   //             builder: (BuildContext) => Home()));
//                   //       },
//                   //       child: Text(
//                   //         'Forget Password?',
//                   //         style: TextStyle(
//                   //             color: Color(0xff025440),
//                   //             fontSize: 12,
//                   //             fontWeight: FontWeight.w600,
//                   //             fontFamily: 'Lato-Regular'),
//                   //       ),
//                   //     )
//                   //   ],
//                   // ),
//                   // SizedBox(
//                   //   height: 40,
//                   // ),
//                   SizedBox(
//                     height: 50,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all(
//                               Color(0xff025440),
//                             ),
//                             shape: MaterialStateProperty.all<
//                                 RoundedRectangleBorder>(RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ))),
//                         onPressed: (() {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (BuildContext) => Nav()));
//                         }),
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(
//                             color: Color(0xfff5f5f5),
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: 'Raleway-Regular',
//                           ),
//                         )),
//                   ),
//                   SizedBox(
//                     height: 36,
//                   ),
//                   Center(
//                     child: RichText(
//                       text: TextSpan(
//                           text: 'You don\'t have an account?',
//                           style: TextStyle(
//                               color: Color(0xff484848),
//                               fontSize: 10,
//                               fontWeight: FontWeight.w400),
//                           children: <TextSpan>[
//                             TextSpan(
//                                 text: ' Sign up ',
//                                 style: TextStyle(
//                                     color: Color(0xff025440),
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.w600),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {})
//                           ]),
//                     ),
                  // ),
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
}
