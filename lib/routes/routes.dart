import 'package:flutter/material.dart';
import 'package:ielts_vocabulary_app/pages/home_page.dart';
import 'package:ielts_vocabulary_app/pages/sign_in_page.dart';
import 'package:ielts_vocabulary_app/pages/sign_up_page.dart';

class Routes {
  static const LOGIN_SCREEN = '/sign-in';
  static const HOME_SCREEN = '/home';
  static const SIGN_UP = '/sign-up';

  static Map<String, Widget Function(BuildContext context)> buildRoutes() {
    return {
      LOGIN_SCREEN: (context) => const SignInPage(),
      HOME_SCREEN: (context) => const HomePage(),
      SIGN_UP: (context) => const SignUpPage()
    };
  }
}
