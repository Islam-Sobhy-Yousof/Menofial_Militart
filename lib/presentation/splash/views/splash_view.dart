import 'dart:async';

import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/common/utils/helpers/helper_functions.dart';
import 'package:menofia_military/presentation/resources/assets_manager.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';
import 'package:menofia_military/presentation/splash/controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

final controller = SplashController.instance;
  @override
  void initState() {
    controller.setTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: Center(
        child: Image.asset(
          ImageAssets.militaryLogo,
          width: HelperFunctions.screenWidth() * AppFractions.f8,
        ),
      ),
    );
  }
}
