import 'package:get/get.dart';
import 'package:menofia_military/domain/models/models.dart';
import 'package:menofia_military/domain/usecases/get_attendance_report_usecase.dart';
import 'package:menofia_military/presentation/common/utils/helpers/show_dialog.dart';
import 'package:menofia_military/presentation/common/widgets/custom_progress_indicator.dart';
import 'package:menofia_military/presentation/common/widgets/states/custom_popup.dart';

class SuperAttendanceViewController extends GetxController {
  static SuperAttendanceViewController get instance => Get.find();
  final isLoading = false.obs;

  final isErrorState = false.obs;

 final  attendanceReportList = <Attendance>[].obs;
  final GetAttendanceReportUsecase _getAttendanceReportUsecase;

  SuperAttendanceViewController(
      {required GetAttendanceReportUsecase getAttendanceReportUsecase})
      : _getAttendanceReportUsecase = getAttendanceReportUsecase;

  Future<List<Attendance>> fetchStudentsAttendanceReport() async {
    isLoading.value = true;
    final response = await _getAttendanceReportUsecase();
    // final emptyAttendanceList = Iterable.empty().cast<Attendance>().toList();
    response.fold((failure) {
      isLoading.value = false;
      isErrorState.value = true;
      return attendanceReportList;
    }, (data) {
      print('islam the data is ${data[0].dates}');
      isLoading.value = false;
      isErrorState.value = false;
      attendanceReportList.value = data;
      return attendanceReportList;
    });
    isLoading.value = false;
    return attendanceReportList;
  }
}
