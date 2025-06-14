import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';
import 'package:menofia_military/presentation/resources/theme_manager.dart';

class MenofiaMilitary extends StatelessWidget {
  const MenofiaMilitary._internal();

  static final MenofiaMilitary _instance = MenofiaMilitary._internal();

  factory MenofiaMilitary() => _instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
     getPages: AppPages.pages,
      initialRoute: Routes.splashRoute,
      unknownRoute: AppPages.unknownRoute(context: context),
    );
  }
}
