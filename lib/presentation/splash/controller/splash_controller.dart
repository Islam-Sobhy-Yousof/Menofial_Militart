import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menofia_military/app/core/local_storage/local_storage_helper.dart';
import 'package:menofia_military/presentation/resources/constants_manager.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();
  final _localStorageHelper = Get.find<LocalStorageHelper>();
  Timer? timer;

  void setTimer() {
    timer = Timer(Duration(seconds: ConstantsManager.splashDelay), _gotNext);
  }

  void _gotNext() {
    final loggedInStudent = _localStorageHelper.getStudentId();

    if (loggedInStudent.isNotEmpty) {
      Get.offAllNamed(
        Routes.studentMainRoute,
      );
      return;
    }

    Get.offAllNamed(
      Routes.studentLoginRoute,
    );

    //TODO: you have to complete the rest of the navigation part
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
