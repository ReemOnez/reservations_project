import 'package:flutter/material.dart';
import 'package:reservations_system/core/routing/routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const Placeholder());
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
