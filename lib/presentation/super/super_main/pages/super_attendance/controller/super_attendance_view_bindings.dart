import 'package:get/get.dart';
import 'package:menofia_military/domain/usecases/get_attendance_report_usecase.dart';
import 'package:menofia_military/presentation/super/super_main/pages/super_attendance/controller/super_attendance_view_controller.dart';

class SuperAttendanceViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      GetAttendanceReportUsecase(
        repository: Get.find(),
      ),
    );
    Get.put(
      SuperAttendanceViewController(
        getAttendanceReportUsecase: Get.find(),
      ),
    );
  }
}
