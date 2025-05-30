import 'dart:async';

import 'package:flutter/material.dart';
import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/app/app_prefs.dart';
import 'package:menofia_military/app/di.dart';
import 'package:menofia_military/presentation/resources/assets_manager.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/constants_manager.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPrefs _appPrefs = instance<AppPrefs>();
  void _startTimer() {
    _timer = Timer(
      Duration(
        seconds: ConstantsManager.splashDelay,
      ),
      _goNext,
    );
  }

  void _goNext() {
    final isSuperLoggedIn = _appPrefs.isSuperLoggedIn();

    if (isSuperLoggedIn) {
      Navigator.pushReplacementNamed(
        context,
        Routes.superMainRoute,
  
      );
      return;
    }
    final isStudentLoggedIn = _appPrefs.isUserLoggedIn();

    if (isStudentLoggedIn) {
      Navigator.pushReplacementNamed(
        context,
        Routes.studentMainRoute,
  
      );
      return;
    }

     Navigator.pushReplacementNamed(
      context,
      Routes.studentLoginRoute,
    
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: Center(
        child: Image.asset(
          ImageAssets.militaryLogo,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
