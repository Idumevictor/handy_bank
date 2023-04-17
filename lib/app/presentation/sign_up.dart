import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:handy_bank/app/presentation/signin_page.dart';
import 'package:handy_bank/widgets/size_config.dart';


class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isVisible = true;
  bool isVisible1 = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
                    height: getProportionateScreenHeight(27),
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
                        'Welcome User',
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
                    height: 22,
                  ),
                  Text(
                    'Sign up to join',
                    style: TextStyle(
                        color: Color(0xff484848),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lato-Regular'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Name',
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
                    controller: _nameController,
                    validator: (value) {
                      if (_nameController.text.isEmpty) {
                        return 'Enter Name';
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
                      hintText: 'Your full name',
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 12,
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
                            borderSide:
                                 BorderSide(color: Color(0xfff5f5f5)),
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
                  Text(
                    'Phone Number',
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
                          borderSide:
                              const BorderSide(color: Color(0xfff5f5f5)),
                          borderRadius: BorderRadius.circular(10)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xfff5f5f5),
                      hintText: '+234',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 12,
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
                    validator: (value) {
                      if (_passwordController.text.isEmpty) {
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
                                    color: Color(0xff025440),
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Color(0xff025440),
                                  ))),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Confirm Password',
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
                    controller: _confirmPasswordController,
                    obscureText: isVisible1,
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xfff5f5f5)),
                            borderRadius: BorderRadius.circular(10)),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: const Color(0xfff5f5f5),
                        hintText: '**********',
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible1 = !isVisible1;
                              });
                            },
                            child: isVisible1
                                ? Icon(Icons.visibility,
                                    color: Color(0xff025440))
                                : Icon(
                                    Icons.visibility_off,
                                    color: Color(0xff025440),
                                  ))),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xff025440),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'I agree to the ',
                            style: TextStyle(
                                color: Color(0xff484848),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Terms of service ',
                                  style: TextStyle(
                                      color: Color(0xff025440),
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
                              Color(0xff025440),
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
                            color: Color(0xffffffff),
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
                              color: Color(0xff484848),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign In ',
                                style: TextStyle(
                                    color: Color(0xff025440),
                                    fontSize: 12,
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
}
