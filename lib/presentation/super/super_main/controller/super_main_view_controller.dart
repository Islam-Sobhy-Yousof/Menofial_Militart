import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menofia_military/app/core/local_storage/local_storage_helper.dart';
import 'package:menofia_military/presentation/resources/strings_manager.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';
import 'package:menofia_military/presentation/super/super_exams/view/super_exams_view.dart';
import 'package:menofia_military/presentation/super/super_main/pages/super_attendance/view/super_attendance.dart';
import 'package:menofia_military/presentation/super/super_main/pages/super_scan/view/super_scan_view.dart';

class SuperMainViewController extends GetxController {
  final _localStorageHelper = Get.find<LocalStorageHelper>();
  static SuperMainViewController get instance => Get.find();

  final List<Widget> pages = [
    SuperAttendance(),
    SuperExamsView(),
    SuperScanView(),
  ];

  late final List<String> pagesTitles;
  final currentIndex = 0.obs;

  void changeSelectedIndex(int index) {
    currentIndex.value = index;
  }

  void logStudentOut() {
    _localStorageHelper.clearStudentData();
    Get.offAllNamed(Routes.studentLoginRoute);
  }

  @override
  void onInit() {
    final studentName = _localStorageHelper.getStudentName();
    pagesTitles = [
      StringsManager.superAttendanceReportPage,
      StringsManager.exams,
      StringsManager.studentsAttendance,
    ];
    super.onInit();
  }
}
