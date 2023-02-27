// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:organico/view/auth/sign_in_page.dart';
import 'package:organico/view/auth/sign_up_page.dart';
import 'package:organico/view/pages/home_page.dart';
import 'package:organico/view/screens/splash_screen.dart';

class RouteGenerator {
  static final RouteGenerator _generator =RouteGenerator._init();

  static RouteGenerator get router => _generator;

  RouteGenerator._init();

  Route<dynamic>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _navigate(const HomePage());
      case 'splash':
        return _navigate(const SplashScreen());
      case 'signUp':
        return _navigate(const SignUpPage());
      case 'signIn':
        return _navigate(const SignInPage());
    }
  }

  MaterialPageRoute _navigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
