import 'package:flutter/material.dart';
import 'package:reservations_system/core/routing/routes.dart';
import 'package:reservations_system/features/login/presentation/login_screen.dart';
import 'package:reservations_system/features/on_boarding/presentation/on_boarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                'No screen Found!',
              ),
            ),
          ),
        );
    }
  }
}
