import 'package:get/get.dart';
import 'package:ielts_vocabulary_app/pages/home/home_binding.dart';
import 'package:ielts_vocabulary_app/pages/home/home_page.dart';
import 'package:ielts_vocabulary_app/pages/sign_in/sign_in_binding.dart';
import 'package:ielts_vocabulary_app/pages/sign_in/sign_in_page.dart';
import 'package:ielts_vocabulary_app/pages/sign_up/sign_up_binding.dart';
import 'package:ielts_vocabulary_app/pages/sign_up/sign_up_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.signIn;

  static final routes = [
    GetPage(name: _Paths.signIn, page: () => const SignInPage(), binding: SignInBinding()),
    GetPage(name: _Paths.home, page: () => const HomePage(), binding: HomeBinding()),
    GetPage(name: _Paths.signUp, page: () => SignUpPage(), binding: SignUpBinding()),
  ];
}
