// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:organico/view/auth/sign_in_page.dart';
import 'package:organico/view/auth/sign_up_page.dart';
import 'package:organico/view/pages/bottom_navigation_pages/home_page.dart';
import 'package:organico/view/pages/total_pages/coupons_page.dart';
import 'package:organico/view/pages/total_pages/info_page.dart';
import 'package:organico/view/pages/total_pages/settings_page.dart';
import 'package:organico/view/pages/total_pages/wish_list_page.dart';
import 'package:organico/view/screens/current_screen.dart';
import 'package:organico/view/screens/splash_screen.dart';

class RouteGenerator {
  static final RouteGenerator _generator = RouteGenerator._init();

  static RouteGenerator get router => _generator;

  RouteGenerator._init();

  Route<dynamic>? onGenerate(RouteSettings settings) {
    Object? args = settings.arguments;
    switch (settings.name) {
      case '/':
        return _navigate(const HomePage());
      case 'splash':
        return _navigate(const SplashScreen());
      case 'signUp':
        return _navigate(const SignUpPage());
      case 'signIn':
        return _navigate(const SignInPage());
      case 'currentScreen':
        return _navigate(const CurrentScreen());
      case 'wishList':
        return _navigate(const WishListPage());
      case 'settings':
        return _navigate(const SettingsPage());
      case 'info':
        return _navigate(InfoPage(data: args as Map<String, dynamic>));
      case 'coupon':
        return _navigate(CouponsPage(data: args as List<Map<String, dynamic>>));
    }
  }

  MaterialPageRoute _navigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
