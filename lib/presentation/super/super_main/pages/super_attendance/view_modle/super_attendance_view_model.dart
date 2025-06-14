import 'dart:async';

import 'package:menofia_military/domain/models/models.dart';
import 'package:menofia_military/domain/usecases/get_attendance_report_usecase.dart';
import 'package:menofia_military/presentation/base/base_view_model.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_impl.dart';

class SuperAttendanceViewModel extends BaseViewModel
    with SuperAttendanceViewModelInput, SuperAttendanceViewModelOutput {
  final StreamController<AttendanceReportObject>
      _attendanceReportStreamController =
      StreamController<AttendanceReportObject>.broadcast();

  final GetAttendanceReportUsecase _getAttendanceReportUsecase;

  SuperAttendanceViewModel(
      {required GetAttendanceReportUsecase getAttendanceReportUsecase})
      : _getAttendanceReportUsecase = getAttendanceReportUsecase;
  @override
  void start() {
    addContentState();
    getAttendanceReport();
  }

  @override
  void dispose() {
    _attendanceReportStreamController.close();
    super.dispose();
  }

  @override
  Sink get attendanceReportInput => _attendanceReportStreamController.sink;

  @override
  Stream<AttendanceReportObject> get attendanceReportOutput =>
      _attendanceReportStreamController.stream.map((data) => data);

  @override
  void getAttendanceReport() async {
    final response = await _getAttendanceReportUsecase();

    response.fold((failure) {
      attendanceReportInput.add(
        Iterable.empty().cast<AttendanceReportObject>().toList(),
      );
    }, (data) {
      addContentState();
      attendanceReportInput.add(
        AttendanceReportObject(attendanceList: data),
      );
    });
  }

  @override
  void addContentState() {
    inputState.add(ContentState());
  }
}

mixin SuperAttendanceViewModelInput {
  void getAttendanceReport();
  void addContentState();
  Sink get attendanceReportInput;
}

mixin SuperAttendanceViewModelOutput {
  Stream<AttendanceReportObject> get attendanceReportOutput;
}

class AttendanceReportObject {
  final List<Attendance> attendanceList;

  AttendanceReportObject({required this.attendanceList});
}
