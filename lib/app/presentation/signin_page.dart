import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';




class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isVisible = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    height: 27,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontFamily: 'Lato-Regular',
                            color: Color(0xff484848),
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff025440),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                        color: Color(0xff484848),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lato-Regular'),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        color: Color(0xff484848),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lato-Regular'),
                  ),
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
                      fillColor: Color(0xfff5f5f5),
                      hintText: 'Your email@gmail.com',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 37,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        color: Color(0xff484848),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lato-Regular'),
                  ),
                  SizedBox(
                    height: 8,
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
                                    color: Color(0xff025440),
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Color(0xff025440),
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
