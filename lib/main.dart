import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reservations_system/core/flavors/flavors_cconfig.dart';
import 'package:reservations_system/core/routing/app_router.dart';
import 'package:reservations_system/firebase_options.dart';
import 'package:reservations_system/reservation_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initApp();
  debugPrint(FlavorConfig.isProduction() ? 'prod flavor' : 'dev flavor');
  runApp(ReservationApp(appRouter: AppRouter()));
}

Future<void> initApp() async {
  FlavorConfig(
    flavor: FlavorConfig.stringToEnum(const String.fromEnvironment('flavor', defaultValue: 'prod')),
    values: FlavorValues(
      stagesURLs: {Flavor.dev: 'https://api.bookit.com/api/', Flavor.prod: 'https://api.bookit.com/api/'},
    ),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
