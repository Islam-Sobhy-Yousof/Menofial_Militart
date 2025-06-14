import 'package:get/get.dart';
import 'package:menofia_military/domain/usecases/register_students_attendance_usecase.dart';
import 'package:menofia_military/presentation/super/super_main/pages/super_scan/controller/super_scan_view_controller.dart';

class SuperScanViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      RegisterStudentsAttendanceUsecase(
        repository: Get.find(),
      ),
    );
    Get.put(
      SuperScanViewController(
        registerStudentsAttendanceUsecase: Get.find(),
      ),
    );
  }
}
