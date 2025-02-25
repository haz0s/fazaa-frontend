import 'package:fazaa/features/auth/login/presentation/views/number_verification_page.dart';
import 'package:fazaa/features/boarding/presentation/views/boarding_page.dart';
import 'package:fazaa/features/splash/presentation/views/splash_page.dart';
import 'package:flutter/material.dart';

import '../../features/auth/login/presentation/views/login_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashPage.routName: (context) => const SplashPage(),
    BoardingPage.routName: (context) => const BoardingPage(),
    LoginPage.routName: (context) => LoginPage(),
    NumberVerificationPage.routeName: (context) => const NumberVerificationPage(
          phoneNumber: "",
        )
  };
}
