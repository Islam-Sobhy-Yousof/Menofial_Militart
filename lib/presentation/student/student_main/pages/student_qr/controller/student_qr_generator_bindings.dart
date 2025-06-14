import 'package:get/get.dart';
import 'package:menofia_military/presentation/student/student_main/pages/student_qr/controller/student_qr_generator_controller.dart';

class StudentQrGeneratorBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StudentQrGeneratorController());
  }

}