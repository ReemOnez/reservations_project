import 'package:flutter/material.dart';
import 'package:reservations_system/core/flavors/flavors_cconfig.dart';
import 'package:reservations_system/core/routing/app_router.dart';
import 'package:reservations_system/reservation_app.dart';

Future<void> main() async {
  initApp();
  debugPrint(FlavorConfig.isProduction() ? 'prod flavor' : 'dev flavor');
  runApp(ReservationApp(appRouter: AppRouter()));
}

Future<void> initApp() async {
  FlavorConfig(
    flavor: FlavorConfig.stringToEnum(const String.fromEnvironment('flavor', defaultValue: 'dev')),
    values: FlavorValues(
      stagesURLs: {Flavor.dev: 'https://api.bookit.com/api/', Flavor.prod: 'https://api.bookit.com/api/'},
    ),
  );
}
