part of 'app_pages.dart';

abstract class Routes{
  Routes._();
  static const signIn = _Paths.signIn;
  static const home = _Paths.home;
  static const signUp = _Paths.signUp;
}


abstract class _Paths{
  static const signIn = '/sign-in';
  static const home = '/home';
  static const signUp = '/sign-up';
}