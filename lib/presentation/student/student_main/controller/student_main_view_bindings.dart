

import 'package:get/get.dart';
import 'package:menofia_military/presentation/student/student_main/controller/student_main_view_controller.dart';

class StudentMainViewBindings extends Bindings {
  @override
  void dependencies() {
   Get.put(StudentMainViewController());
  }

}