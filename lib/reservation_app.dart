import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reservations_system/core/routing/app_router.dart';
import 'package:reservations_system/core/routing/routes.dart';
import 'package:reservations_system/core/themeing/colors.dart';

class ReservationApp extends StatelessWidget {
  final AppRouter appRouter;

  const ReservationApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Reservations App',
        theme: ThemeData(
          primaryColor: AppColors.mainColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.onBoardingScreen,
      ),
    );
  }
}
