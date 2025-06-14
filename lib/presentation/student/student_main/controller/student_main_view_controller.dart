import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menofia_military/app/core/local_storage/local_storage_helper.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';
import 'package:menofia_military/presentation/student/student_main/pages/student_exams/view/student_exams.dart';
import 'package:menofia_military/presentation/student/student_main/pages/student_qr/view/student_qr_genrator_view.dart';

class StudentMainViewController extends GetxController {
  final _localStorageHelper = Get.find<LocalStorageHelper>();
  static StudentMainViewController get controller => Get.find();

  final List<Widget> pages = [
    Container(
      color: Colors.redAccent,
    ),

    StudentExams(),
// StudentQrGenratorView(),

    StudentQrGenratorView(),
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
      '${StringsManager.hiMessage} $studentName',
      StringsManager.studentsExams,
      StringsManager.studentQrGenerator,
    ];
    super.onInit();
  }
}
