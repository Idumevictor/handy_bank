import 'package:flutter/material.dart';

const String Base_URL = '';

class ApiEndpoints {
  static String registerUser() {
    return '${Base_URL}/';
  }

  static String signUpUser() {
    return 'https://handy-bank.herokuapp.com/api/sign-up';
  }

  static String logInUser() {
    return 'https://handy-bank.herokuapp.com/api/login';
  }

  static String retrieveAccount({required String phoneNumber}) {
    return 'https://handy-bank.herokuapp.com/api/account-number?phoneNumber=08134677901';
  }
}
