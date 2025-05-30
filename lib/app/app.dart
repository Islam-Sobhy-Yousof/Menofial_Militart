import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';
import 'package:menofia_military/presentation/resources/theme_manager.dart';


class MenofiaMilitary extends StatefulWidget {
  const MenofiaMilitary._internal();

  static final MenofiaMilitary _instance = MenofiaMilitary._internal();

  factory MenofiaMilitary() => _instance;

  @override
  State<MenofiaMilitary> createState() => _MenofiaMilitaryState();
}


class _MenofiaMilitaryState extends State<MenofiaMilitary> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
